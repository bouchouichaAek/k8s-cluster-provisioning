#!/bin/bash
echo "Checking for SUDO_PASS..."


if [[ -z "$SUDO_PASS" ]]; then
  echo "ERROR: SUDO_PASS env variable is not set."
  exit 1
fi


echo "Setting up Kubernetes cluster..."
echo "provisioning VMs resources..."
# ── Provisioning VMs resources Using Terraform ──────────────────────────────────────────────────

terraform init
terraform plan
terraform apply -auto-approve

# ── Get IPs from Terraform ──────────────────────────────────────────────────

master_public_ip=$(terraform output -raw master_public_ip)
worker_public_ips=$(terraform output -json worker_public_ips | jq -r '.[]')
ansible_user=$(terraform output -raw admin_username)
ssh_key=$(terraform output -raw ssh_key_path)

# ── Install jq ──────────────────────────────────────────────────────────────


echo "installing jq package..."

echo "$SUDO_PASS" | sudo -S apt-get update -y
echo "$SUDO_PASS" | sudo -S apt-get install -y jq

# ── Build Ansible inventory ─────────────────────────────────────────────────

{
  echo "[master]"
  echo "$master_public_ip"
  echo "[worker]"
  echo "$worker_public_ips"
} > hosts

# ── Pre-trust all node keys (prevents SSH interactive prompt) ───────────────
echo "Scanning host keys..."

all_ips=("$master_public_ip")
while IFS= read -r ip; do
  all_ips+=("$ip")
done <<< "$worker_public_ips"

for ip in "${all_ips[@]}"; do
  echo "  → trusting $ip"
  ssh-keyscan -H "$ip" >> ~/.ssh/known_hosts 2>/dev/null
done


echo "All nodes trusted. Ready to connect."

## Install Kubernetes components on all nodes

# Generate ansible.cfg
cat > ansible.cfg << EOF
[defaults]
inventory = hosts
remote_user = $ansible_user
private_key_file = $ssh_key
host_key_checking = False
EOF


# Generate group_vars
mkdir -p group_vars
cat > group_vars/all.yml << EOF
ansible_user: $ansible_user
ansible_ssh_private_key_file: $ssh_key
EOF

echo "✓ hosts file generated"
echo "✓ ansible.cfg generated"
echo "✓ group_vars/all.yml generated"
echo ""
echo "Running playbook..."

ansible-playbook ansible-playbook.yaml

