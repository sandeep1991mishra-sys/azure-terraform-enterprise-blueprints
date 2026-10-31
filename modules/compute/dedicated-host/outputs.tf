output "ids" {
  description = "IDs of created Dedicated Hosts."
  value       = { for key, resource in azurerm_dedicated_host.resource : key => resource.id }
}

output "names" {
  description = "Names of created Dedicated Hosts."
  value       = { for key, resource in azurerm_dedicated_host.resource : key => resource.name }
}
