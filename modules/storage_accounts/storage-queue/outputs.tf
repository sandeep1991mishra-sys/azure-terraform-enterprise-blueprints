output "ids" { value = { for k, v in azurerm_storage_queue.this : k => v.id } }
