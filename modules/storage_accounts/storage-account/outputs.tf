output "ids" { value = { for k, v in azurerm_storage_account.this : k => v.id } }
output "primary_blob_endpoints" { value = { for k, v in azurerm_storage_account.this : k => v.primary_blob_endpoint } }
