output "ids" {
  description = "Virtual network gateway connection IDs."
  value       = { for key, resource in azurerm_virtual_network_gateway_connection.resource : key => resource.id }
}

output "names" {
  description = "Virtual network gateway connection names."
  value       = { for key, resource in azurerm_virtual_network_gateway_connection.resource : key => resource.name }
}
