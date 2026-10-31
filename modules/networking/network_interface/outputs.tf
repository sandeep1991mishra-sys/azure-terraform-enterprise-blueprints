output "ids" {
  description = "Map of Network Interface IDs."
  value       = { for key, nic in azurerm_network_interface.network_interfaces : key => nic.id }
}

output "names" {
  description = "Map of Network Interface names."
  value       = { for key, nic in azurerm_network_interface.network_interfaces : key => nic.name }
}

output "private_ip_addresses" {
  description = "Map of primary private IP addresses."
  value       = { for key, nic in azurerm_network_interface.network_interfaces : key => nic.private_ip_address }
}

output "mac_addresses" {
  description = "Map of Network Interface MAC addresses."
  value       = { for key, nic in azurerm_network_interface.network_interfaces : key => nic.mac_address }
}

output "locations" {
  description = "Map of Azure regions."
  value       = { for key, nic in azurerm_network_interface.network_interfaces : key => nic.location }
}
