output "ids" {
  description = "Resource IDs."
  value       = { for key, resource in azurerm_private_link_service.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value       = { for key, resource in azurerm_private_link_service.resource : key => resource.name }
}
