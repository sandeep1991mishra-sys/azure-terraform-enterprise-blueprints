output "ids" {
  description = "Map of route IDs."
  value       = { for key, route in azurerm_route.routes : key => route.id }
}

output "names" {
  description = "Map of route names."
  value       = { for key, route in azurerm_route.routes : key => route.name }
}

output "address_prefixes" {
  description = "Map of route destination address prefixes."
  value       = { for key, route in azurerm_route.routes : key => route.address_prefix }
}

output "next_hop_types" {
  description = "Map of route next-hop types."
  value       = { for key, route in azurerm_route.routes : key => route.next_hop_type }
}

output "route_table_names" {
  description = "Map of route table names associated with the routes."
  value       = { for key, route in azurerm_route.routes : key => route.route_table_name }
}
