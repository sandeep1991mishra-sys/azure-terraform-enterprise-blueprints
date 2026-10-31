output "ids" {
  description = "Resource IDs."
  value       = { for key, resource in azurerm_bastion_host.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value       = { for key, resource in azurerm_bastion_host.resource : key => resource.name }
}
