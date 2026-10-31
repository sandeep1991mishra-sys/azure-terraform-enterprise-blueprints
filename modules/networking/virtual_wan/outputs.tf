output "ids" {
  description = "Map of Azure Virtual WAN resource IDs."
  value       = { for key, wan in azurerm_virtual_wan.virtual_wans : key => wan.id }
}

output "names" {
  description = "Map of Azure Virtual WAN names."
  value       = { for key, wan in azurerm_virtual_wan.virtual_wans : key => wan.name }
}

output "locations" {
  description = "Map of Azure Virtual WAN locations."
  value       = { for key, wan in azurerm_virtual_wan.virtual_wans : key => wan.location }
}

output "resource_group_names" {
  description = "Map of Virtual WAN Resource Group names."
  value       = { for key, wan in azurerm_virtual_wan.virtual_wans : key => wan.resource_group_name }
}

output "types" {
  description = "Map of Virtual WAN types."
  value       = { for key, wan in azurerm_virtual_wan.virtual_wans : key => wan.type }
}
