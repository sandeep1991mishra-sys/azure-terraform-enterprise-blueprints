output "ids" {
  description = "Map of Azure Virtual Network Manager resource IDs."
  value       = { for key, manager in azurerm_network_manager.network_managers : key => manager.id }
}

output "names" {
  description = "Map of Azure Virtual Network Manager names."
  value       = { for key, manager in azurerm_network_manager.network_managers : key => manager.name }
}

output "locations" {
  description = "Map of Azure Virtual Network Manager locations."
  value       = { for key, manager in azurerm_network_manager.network_managers : key => manager.location }
}

output "resource_group_names" {
  description = "Map of Network Manager Resource Group names."
  value       = { for key, manager in azurerm_network_manager.network_managers : key => manager.resource_group_name }
}
