output "ids" { value = { for k, v in azurerm_data_protection_backup_vault.this : k => v.id } }
