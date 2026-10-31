output "ids" { value = { for k, v in azurerm_security_center_contact.this : k => v.id } }
