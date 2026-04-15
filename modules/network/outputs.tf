output "subnet_id" {
  description = "The ID of the k8s subnet"
  value       = azurerm_subnet.k8s_subnet.id
}
