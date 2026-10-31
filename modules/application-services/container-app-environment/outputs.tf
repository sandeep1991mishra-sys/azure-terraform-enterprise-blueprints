output "ids" { value = { for k, v in azurerm_container_app_environment.this : k => v.id } }
output "default_domain" { value = { for k, v in azurerm_container_app_environment.this : k => v.default_domain } }
