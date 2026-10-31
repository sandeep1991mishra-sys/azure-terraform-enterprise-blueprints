output "ids" {
  description = "IDs of created resources."
  value       = { for key, resource in azurerm_capacity_reservation.resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value       = { for key, resource in azurerm_capacity_reservation.resource : key => resource.name }
}
