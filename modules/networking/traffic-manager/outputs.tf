output "ids" {
  description = "Resource IDs."
  value = { for key, resource in azurerm_traffic_manager_profile.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value = { for key, resource in azurerm_traffic_manager_profile.resource : key => resource.name }
}
