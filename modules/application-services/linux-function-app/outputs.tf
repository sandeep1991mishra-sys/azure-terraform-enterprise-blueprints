output "ids" { value = { for k, v in azurerm_linux_function_app.this : k => v.id } }
output "default_hostnames" { value = { for k, v in azurerm_linux_function_app.this : k => v.default_hostname } }
