output "ids" {
  description = "Resource IDs."
  value       = { for key, resource in azurerm_local_network_gateway.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value       = { for key, resource in azurerm_local_network_gateway.resource : key => resource.name }
}
