output "ids" {
  description = "Map of subnet route table association IDs."
  value       = { for key, association in azurerm_subnet_route_table_association.associations : key => association.id }
}

output "subnet_ids" {
  description = "Map of associated subnet IDs."
  value       = { for key, association in azurerm_subnet_route_table_association.associations : key => association.subnet_id }
}

output "route_table_ids" {
  description = "Map of associated route table IDs."
  value       = { for key, association in azurerm_subnet_route_table_association.associations : key => association.route_table_id }
}
