output "ids" {
  description = "IDs of created resources."
  value = { for key, resource in azurerm_host_group.resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value = { for key, resource in azurerm_host_group.resource : key => resource.name }
}
