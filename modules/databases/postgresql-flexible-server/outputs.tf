output "ids" { value = { for k, v in azurerm_postgresql_flexible_server.this : k => v.id } }
output "fqdn" { value = { for k, v in azurerm_postgresql_flexible_server.this : k => v.fqdn } }
