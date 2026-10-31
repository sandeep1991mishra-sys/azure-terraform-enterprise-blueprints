
output "ids" {
  description = "Map of Virtual Network peering IDs."
  value       = { for key, peering in azurerm_virtual_network_peering.vnet_peerings : key => peering.id }
}

output "names" {
  description = "Map of Virtual Network peering names."
  value       = { for key, peering in azurerm_virtual_network_peering.vnet_peerings : key => peering.name }
}

output "peering_states" {
  description = "Map of Virtual Network peering states."
  value       = { for key, peering in azurerm_virtual_network_peering.vnet_peerings : key => peering.peering_state }
}

output "virtual_network_names" {
  description = "Map of local Virtual Network names."
  value       = { for key, peering in azurerm_virtual_network_peering.vnet_peerings : key => peering.virtual_network_name }
}

output "remote_virtual_network_ids" {
  description = "Map of remote Virtual Network IDs."
  value       = { for key, peering in azurerm_virtual_network_peering.vnet_peerings : key => peering.remote_virtual_network_id }
}
