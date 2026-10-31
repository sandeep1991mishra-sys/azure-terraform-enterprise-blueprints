output "ids" { value = { for k, v in azurerm_app_configuration.this : k => v.id } }
output "endpoint" { value = { for k, v in azurerm_app_configuration.this : k => v.endpoint } }
