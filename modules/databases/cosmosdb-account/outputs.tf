output "ids" { value = { for k, v in azurerm_cosmosdb_account.this : k => v.id } }
output "endpoint" { value = { for k, v in azurerm_cosmosdb_account.this : k => v.endpoint } }
