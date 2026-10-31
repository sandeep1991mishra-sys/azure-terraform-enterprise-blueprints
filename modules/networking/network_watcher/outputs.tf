output "ids" {
  description = "Map of Network Watcher resource IDs."
  value       = { for key, watcher in azurerm_network_watcher.network_watchers : key => watcher.id }
}

output "names" {
  description = "Map of Network Watcher names."
  value       = { for key, watcher in azurerm_network_watcher.network_watchers : key => watcher.name }
}

output "locations" {
  description = "Map of Network Watcher locations."
  value       = { for key, watcher in azurerm_network_watcher.network_watchers : key => watcher.location }
}

output "resource_group_names" {
  description = "Map of Network Watcher Resource Group names."
  value       = { for key, watcher in azurerm_network_watcher.network_watchers : key => watcher.resource_group_name }
}