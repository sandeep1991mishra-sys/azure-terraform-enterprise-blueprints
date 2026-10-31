output "ids" {
  description = "Resource IDs."
  value = { for key, resource in azurerm_private_dns_zone.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value = { for key, resource in azurerm_private_dns_zone.resource : key => resource.name }
}
