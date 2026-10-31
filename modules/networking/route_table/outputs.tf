output "ids" {
  description = "Map of route table IDs."
  value       = { for key, route_table in azurerm_route_table.route_tables : key => route_table.id }
}

output "names" {
  description = "Map of route table names."
  value       = { for key, route_table in azurerm_route_table.route_tables : key => route_table.name }
}

output "locations" {
  description = "Map of route table locations."
  value       = { for key, route_table in azurerm_route_table.route_tables : key => route_table.location }
}

output "resource_group_names" {
  description = "Map of resource group names."
  value       = { for key, route_table in azurerm_route_table.route_tables : key => route_table.resource_group_name }
}
