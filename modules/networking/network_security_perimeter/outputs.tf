output "ids" {
  description = "Map of Network Security Perimeter resource IDs."
  value       = { for key, perimeter in azurerm_network_security_perimeter.perimeters : key => perimeter.id }
}

output "names" {
  description = "Map of Network Security Perimeter names."
  value       = { for key, perimeter in azurerm_network_security_perimeter.perimeters : key => perimeter.name }
}

output "locations" {
  description = "Map of Network Security Perimeter locations."
  value       = { for key, perimeter in azurerm_network_security_perimeter.perimeters : key => perimeter.location }
}

output "resource_group_names" {
  description = "Map of Network Security Perimeter Resource Group names."
  value       = { for key, perimeter in azurerm_network_security_perimeter.perimeters : key => perimeter.resource_group_name }
}
