output "ids" {
  description = "Resource IDs."
  value       = { for key, resource in azurerm_express_route_circuit.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value       = { for key, resource in azurerm_express_route_circuit.resource : key => resource.name }
}
