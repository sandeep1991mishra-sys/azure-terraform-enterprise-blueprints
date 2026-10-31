output "ids" {
  description = "Resource IDs."
  value       = { for key, resource in azurerm_cdn_frontdoor_profile.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value       = { for key, resource in azurerm_cdn_frontdoor_profile.resource : key => resource.name }
}
