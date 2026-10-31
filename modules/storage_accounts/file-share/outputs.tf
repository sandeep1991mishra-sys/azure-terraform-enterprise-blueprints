output "ids" { value = { for k, v in azurerm_storage_share.this : k => v.id } }
