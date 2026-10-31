output "ids" {
  description = "IDs of created resources."
  value       = { for key, resource in azurerm_windows_virtual_machine.resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value       = { for key, resource in azurerm_windows_virtual_machine.resource : key => resource.name }
}
