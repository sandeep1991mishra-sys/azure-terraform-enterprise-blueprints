output "ids" {
  description = "Map of DDoS Protection Plan resource IDs."
  value       = { for key, plan in azurerm_network_ddos_protection_plan.ddos_protection_plans : key => plan.id }
}

output "names" {
  description = "Map of DDoS Protection Plan names."
  value       = { for key, plan in azurerm_network_ddos_protection_plan.ddos_protection_plans : key => plan.name }
}

output "locations" {
  description = "Map of DDoS Protection Plan locations."
  value       = { for key, plan in azurerm_network_ddos_protection_plan.ddos_protection_plans : key => plan.location }
}

output "resource_group_names" {
  description = "Map of DDoS Protection Plan Resource Group names."
  value       = { for key, plan in azurerm_network_ddos_protection_plan.ddos_protection_plans : key => plan.resource_group_name }
}