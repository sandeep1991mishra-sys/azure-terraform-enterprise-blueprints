output "ids" {
  description = "IDs of created resources."
  value = { for key, resource in azurerm_virtual_machine_run_command.resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value = { for key, resource in azurerm_virtual_machine_run_command.resource : key => resource.name }
}
