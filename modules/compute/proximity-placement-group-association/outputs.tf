output "ids" {
  description = "IDs of created resources."
  value = { for key, resource in azurerm_proximity_placement_group.resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value = { for key, resource in azurerm_proximity_placement_group.resource : key => resource.name }
}
