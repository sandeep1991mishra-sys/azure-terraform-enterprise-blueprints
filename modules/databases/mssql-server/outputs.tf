output "ids" { value = { for k, v in azurerm_mssql_server.this : k => v.id } }
output "fully_qualified_domain_names" { value = { for k, v in azurerm_mssql_server.this : k => v.fully_qualified_domain_name } }
