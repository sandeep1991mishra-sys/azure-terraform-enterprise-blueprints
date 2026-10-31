output "ids" { value = { for k, v in azurerm_key_vault.this : k => v.id } }
output "vault_uris" { value = { for k, v in azurerm_key_vault.this : k => v.vault_uri } }
