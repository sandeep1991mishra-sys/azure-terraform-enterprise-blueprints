output "ids" { value = { for k, v in azurerm_federated_identity_credential.this : k => v.id } }
