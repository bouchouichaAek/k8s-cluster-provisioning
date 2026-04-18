# k8s-cluster-provisioning — Documentation

## Short purpose

This repository contains Terraform code and helper scripts to provision a small Kubernetes cluster (master + workers) and bootstrap nodes with Ansible. The repo is organized into a root Terraform configuration and two reusable modules (`network` and `vm`). A helper `setup.sh` script automates Terraform runs and prepares an Ansible inventory.

Checklist (what this doc covers)

- [x] Repo purpose and high-level flow
- [x] Files and module map
- [x] Prerequisites and environment notes (Windows/WSL)
- [x] Step-by-step: provision infra, build inventory, run Ansible
- [x] Troubleshooting hints and common fixes
- [x] Security and next steps

Repository layout (important files)

- `main.tf` — root Terraform configuration that wires modules and resources.
- `provider.tf` — Terraform provider(s) configuration (cloud provider and authentication).
- `variables.tf` — root variables and defaults used by the configuration.
- `terraform.tfvars` — project-specific variable values (sensitive values may live here).
- `locals.tf` — local values used by Terraform (e.g., node sizes). Example excerpt:
  ```hcl
  locals {
    nodes = {
      master  = "Standard_B2s"
      worker1 = "Standard_B1s"
      worker2 = "Standard_B1s"
    }
  }
  ```
- `outputs.tf` — outputs exposed by the root module, e.g. `master_public_ip`, `worker_public_ips`, `admin_username`, `ssh_key_path`.
- `setup.sh` — helper shell script that runs Terraform, installs `jq` (if needed), extracts outputs and writes an Ansible-style `hosts` inventory, creates `ansible.cfg` and `group_vars/all.yml`, and runs `ansible-playbook`.
- `ansible-playbook.yaml` — Ansible playbook used to install Kubernetes components (present in the repo; ensure it matches your desired tasks).
- `modules/network/` — Terraform module that sets up the network (VNet, subnets, NSGs, public IPs, etc.). See module folder README for details.
- `modules/vm/` — Terraform module that provisions virtual machines and attaches network resources.

## Prerequisites

- Terraform (match the version required by this repo). Install and add to PATH.
- jq (JSON processor) used by `setup.sh` when parsing `terraform output -json`.
- Ansible (control machine that will run playbooks).
- A Bash-compatible shell on Windows: WSL (recommended) or Git Bash. `setup.sh` is a Bash script.
- SSH private key accessible to Ansible and referenced by Terraform/outputs.

Important environment notes for Windows users

- The repo assumes a Unix-like shell for `setup.sh`. On Windows run it via WSL or Git Bash. Example from PowerShell:
  ```powershell
  wsl bash ./setup.sh
  ```
- Alternatively open a Git Bash or WSL terminal in the repo folder and run `./setup.sh`.

## High-level workflow

1. Prepare variables in `terraform.tfvars` (or supply via CLI/env).
2. Run `setup.sh` (or run the terraform commands manually):
   - `terraform init`
   - `terraform plan` (or `terraform plan -out=tfplan`)
   - `terraform apply` (or `terraform apply tfplan`)
3. `setup.sh` extracts outputs and writes `hosts`, `ansible.cfg`, and `group_vars/all.yml`.
4. `setup.sh` calls `ansible-playbook` with the generated inventory to install Kubernetes components.

## How to run (recommended safe sequence)

Run from WSL or a Linux shell. Replace values as needed.

1. Inspect variables and optionally modify `terraform.tfvars`.

2. Initialize and plan (safe):

```bash
cd /mnt/d/IT/IaC/k8s-cluster-provisioning
terraform init
terraform plan -out=tfplan
```

3. Apply the plan (explicit):

```bash
terraform apply -auto-approve tfplan
```

4. Or use the helper (runs init/plan/apply and then Ansible):

```bash
./setup.sh
```

If you run `setup.sh` on Windows from PowerShell:

```powershell
wsl bash ./setup.sh
```

## Ansible invocation (manual)

If you prefer to run Ansible manually after `setup.sh` creates the `hosts` file:

1. Inspect `hosts` (the generated inventory):

```bash
cat hosts
```

2. Run the playbook specifying the inventory, admin user and private key (adjust paths):

```bash
ADMIN_USER=azureuser SSH_KEY="/home/you/.ssh/id_rsa" ansible-playbook -i hosts ansible-playbook.yaml
```

Or with explicit flags:

```bash
ansible-playbook -i hosts ansible-playbook.yaml -u azureuser --private-key /home/you/.ssh/id_rsa
```

What `setup.sh` does (summary)

- Ensures `terraform` runs to produce the VM resources.
- Extracts `master_public_ip`, `worker_public_ips`, `admin_username` and `ssh_key_path` from Terraform outputs.
- Optionally installs `jq` (script may call apt-get; requires sudo password or to run from an elevated shell).
- Writes a simple Ansible inventory file `hosts` with `[master]` and `[worker]` groups.
- Scans SSH host keys and appends them to `~/.ssh/known_hosts` to avoid interactive prompts.
- Generates `ansible.cfg` and `group_vars/all.yml` to tell Ansible which user and private key to use.
- Runs `ansible-playbook ansible-playbook.yaml`.

## Common failure modes & troubleshooting

- Terraform errors: run `terraform plan` and inspect the plan. Ensure provider credentials are configured.
- Missing `jq`: install it on the machine running `setup.sh` (WSL/Git Bash). Example (Debian/Ubuntu):
  ```bash
  sudo apt-get update && sudo apt-get install -y jq
  ```
- `terraform output -raw` failures: some Terraform versions or output types don't support `-raw`. Use `terraform output -json` and parse with `jq` instead.
- Inventory empty or wrong: open `hosts` and ensure IPs are present under `[master]` and `[worker]`. If empty, check Terraform outputs with:
  ```bash
  terraform output --json
  ```
- SSH authentication errors: ensure the Ansible private key matches `authorized_keys` on the VMs, the `admin_username` exists, and correct SSH user is used.
- Remote Python missing: cloud images may not include `/usr/bin/python`. Either install Python in a cloud-init script or set `ansible_python_interpreter` to `python3`.
- APT lock errors (when installing packages remotely): wait for cloud-init to finish or re-run the playbook.

## Security notes

- Do not commit private keys or secrets to the repository. Keep them outside the repo and reference via variables or environment.
- `setup.sh` may append host keys to `~/.ssh/known_hosts` — validate hosts separately if in a sensitive environment.
- `ansible.cfg` and `group_vars/all.yml` generated by the script include the private key path; ensure file permissions are restricted.

## Next steps and improvements

- Move sensitive values to an external secret store or use environment variables rather than committing to `terraform.tfvars`.
- Make `setup.sh` idempotent and add better error handling (check `terraform` version, detect missing outputs, atomic file writes).
- Add a CI lint job to validate Terraform formatting (`terraform fmt -check`) and plan.
- Expand the Ansible playbook to configure a full HA control-plane and cluster join with `kubeadm` (or switch to a managed Kubernetes service).

## Appendix: quick commands summary

```bash
# 1. init + plan
terraform init
terraform plan -out=tfplan

# 2. apply
terraform apply -auto-approve tfplan

# 3. quick inventory check
cat hosts
ansible-inventory -i hosts --list

# 4. run playbook
ansible-playbook -i hosts ansible-playbook.yaml -u <admin_user> --private-key /path/to/id_rsa
```

If you'd like, I can:

- create this file in the repo (I already added `DOCUMENTATION.md`),
- patch `setup.sh` to be more robust and portable, or
- add a small `diagnose_ansible.sh` helper to capture verbose ansible output for debugging.

End of document.
