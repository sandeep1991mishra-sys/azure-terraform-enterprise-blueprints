output "ids" { value = { for k, v in azurerm_private_dns_zone_virtual_network_link.this : k => v.id } }
