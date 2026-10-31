output "ids" { value = { for k, v in azurerm_dns_zone.this : k => v.id } }
output "name_servers" { value = { for k, v in azurerm_dns_zone.this : k => v.name_servers } }
