output "ids" { value = { for k, v in azurerm_dns_cname_record.this : k => v.id } }
