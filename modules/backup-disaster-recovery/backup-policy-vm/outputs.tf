output "ids" { value = { for k, v in azurerm_backup_policy_vm.this : k => v.id } }
