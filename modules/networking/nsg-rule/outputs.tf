output "ids" {
  description = "IDs of managed NSG rules."
  value       = { for key, rule in azurerm_network_security_rule.nsg_rules : key => rule.id }
}

output "names" {
  description = "Names of managed NSG rules."
  value       = { for key, rule in azurerm_network_security_rule.nsg_rules : key => rule.name }
}

output "priorities" {
  description = "Priorities of managed Network Security Rules."
  value       = { for key, rule in azurerm_network_security_rule.nsg_rules : key => rule.priority }
}

output "network_security_group_names" {
  description = "NSGs containing the managed rules."
  value       = { for key, rule in azurerm_network_security_rule.nsg_rules : key => rule.network_security_group_name }
}
