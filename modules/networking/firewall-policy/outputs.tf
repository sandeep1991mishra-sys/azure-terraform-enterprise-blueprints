output "ids" {
  description = "Resource IDs."
  value       = { for key, resource in azurerm_firewall_policy.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value       = { for key, resource in azurerm_firewall_policy.resource : key => resource.name }
}
