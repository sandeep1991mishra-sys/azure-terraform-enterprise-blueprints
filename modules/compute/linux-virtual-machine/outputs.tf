output "ids" {
  description = "IDs of created resources."
  value       = { for key, resource in azurerm_linux_virtual_machine.resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value       = { for key, resource in azurerm_linux_virtual_machine.resource : key => resource.name }
}
