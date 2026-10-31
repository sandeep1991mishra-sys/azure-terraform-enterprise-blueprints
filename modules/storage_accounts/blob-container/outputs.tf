output "ids" { value = { for k, v in azurerm_storage_container.this : k => v.id } }
