output "ids" {
  description = "IDs of created resources."
  value = { for key, resource in azurerm_managed_disk.resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value = { for key, resource in azurerm_managed_disk.resource : key => resource.name }
}
