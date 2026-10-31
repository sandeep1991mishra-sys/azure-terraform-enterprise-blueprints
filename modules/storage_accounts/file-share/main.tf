resource "azurerm_storage_share" "this" {
  for_each           = var.shares
  name               = each.value.name
  storage_account_id = each.value.storage_account_id
  quota              = each.value.quota
  access_tier        = each.value.access_tier
  enabled_protocol   = each.value.enabled_protocol
  metadata           = each.value.metadata
}
