output "ids" {
  description = "Resource IDs."
  value       = { for key, resource in azurerm_private_dns_zone_virtual_network_link.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value       = { for key, resource in azurerm_private_dns_zone_virtual_network_link.resource : key => resource.name }
}
