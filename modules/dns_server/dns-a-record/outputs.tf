output "ids" { value = { for k, v in azurerm_dns_a_record.this : k => v.id } }
