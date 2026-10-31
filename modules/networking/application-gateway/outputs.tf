output "ids" {
  description = "Resource IDs."
  value = { for key, resource in azurerm_application_gateway.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value = { for key, resource in azurerm_application_gateway.resource : key => resource.name }
}
