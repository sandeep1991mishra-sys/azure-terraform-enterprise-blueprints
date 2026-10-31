output "ids" { value = { for k, v in azurerm_backup_protected_vm.this : k => v.id } }
