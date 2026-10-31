output "ids" {
  description = "Map of NAT Gateway IDs."
  value       = { for key, nat in azurerm_nat_gateway.nat_gateways : key => nat.id }
}

output "names" {
  description = "Map of NAT Gateway names."
  value       = { for key, nat in azurerm_nat_gateway.nat_gateways : key => nat.name }
}

output "locations" {
  description = "Map of NAT Gateway locations."
  value       = { for key, nat in azurerm_nat_gateway.nat_gateways : key => nat.location }
}

output "resource_group_names" {
  description = "Map of NAT Gateway resource group names."
  value       = { for key, nat in azurerm_nat_gateway.nat_gateways : key => nat.resource_group_name }
}
