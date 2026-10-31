output "ids" { value = { for k, v in azurerm_storage_management_policy.this : k => v.id } }
