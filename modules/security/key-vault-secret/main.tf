resource "azurerm_key_vault_secret" "this" {
  for_each = nonsensitive(toset(keys(var.secrets)))

  name            = var.secrets[each.key].name
  value           = var.secrets[each.key].value
  key_vault_id    = var.secrets[each.key].key_vault_id
  content_type    = var.secrets[each.key].content_type
  not_before_date = var.secrets[each.key].not_before_date
  expiration_date = var.secrets[each.key].expiration_date
}
