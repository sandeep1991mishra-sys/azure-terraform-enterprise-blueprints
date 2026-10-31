
output "ids" {
  description = "Map of IP Group resource IDs."
  value       = { for key, ip_group in azurerm_ip_group.ip_groups : key => ip_group.id }
}

output "names" {
  description = "Map of IP Group names."
  value       = { for key, ip_group in azurerm_ip_group.ip_groups : key => ip_group.name }
}

output "locations" {
  description = "Map of IP Group locations."
  value       = { for key, ip_group in azurerm_ip_group.ip_groups : key => ip_group.location }
}

output "resource_group_names" {
  description = "Map of IP Group Resource Group names."
  value       = { for key, ip_group in azurerm_ip_group.ip_groups : key => ip_group.resource_group_name }
}

output "cidrs" {
  description = "Map of IP address ranges configured in each IP Group."
  value       = { for key, ip_group in azurerm_ip_group.ip_groups : key => ip_group.cidrs }
}
