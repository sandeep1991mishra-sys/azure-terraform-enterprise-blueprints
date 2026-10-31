output "ids" { value = { for k, v in azurerm_service_plan.this : k => v.id } }
output "names" { value = { for k, v in azurerm_service_plan.this : k => v.name } }
