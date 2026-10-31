resource "azurerm_key_vault_secret" "this" {
  for_each = var.secrets
  name         = each.value.name
  value        = each.value.value
  key_vault_id = each.value.key_vault_id
  content_type = each.value.content_type
  not_before_date = each.value.not_before_date
  expiration_date = each.value.expiration_date
}
