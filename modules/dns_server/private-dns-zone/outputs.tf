output "ids" { value = { for k, v in azurerm_private_dns_zone.this : k => v.id } }
