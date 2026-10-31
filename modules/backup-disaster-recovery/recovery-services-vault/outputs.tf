output "ids" { value = { for k, v in azurerm_recovery_services_vault.this : k => v.id } }
output "names" { value = { for k, v in azurerm_recovery_services_vault.this : k => v.name } }
