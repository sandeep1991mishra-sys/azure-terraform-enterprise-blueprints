output "ids" { value = { for k, v in azurerm_network_security_perimeter.this : k => v.id } }
