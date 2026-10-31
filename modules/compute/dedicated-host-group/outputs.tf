output "ids" {
  description = "IDs of created Dedicated Host Groups."
  value       = { for key, resource in azurerm_dedicated_host_group.resource : key => resource.id }
}

output "names" {
  description = "Names of created Dedicated Host Groups."
  value       = { for key, resource in azurerm_dedicated_host_group.resource : key => resource.name }
}
