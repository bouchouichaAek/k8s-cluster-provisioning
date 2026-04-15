
output "public_ip" {
  description = "Public IP of the VM"
  value       = azurerm_public_ip.k8s_public_ip.ip_address # ✅ direct reference, no loop
}
