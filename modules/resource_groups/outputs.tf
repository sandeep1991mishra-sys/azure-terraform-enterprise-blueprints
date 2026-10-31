output "ids" {
  description = "IDs of the created resource groups."
  value       = { for key, resource_group in azurerm_resource_group.resource_groups : key => resource_group.id }
}

output "names" {
  description = "Names of the created resource groups."
  value       = { for key, resource_group in azurerm_resource_group.resource_groups : key => resource_group.name }
}

output "locations" {
  description = "Locations of the created resource groups."
  value       = { for key, resource_group in azurerm_resource_group.resource_groups : key => resource_group.location }
}
