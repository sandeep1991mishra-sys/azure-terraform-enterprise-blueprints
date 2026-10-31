output "ids" {
  description = "IDs of created resources."
  value       = { for key, resource in azurerm_virtual_machine_extension.resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value       = { for key, resource in azurerm_virtual_machine_extension.resource : key => resource.name }
}
