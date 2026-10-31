resource "azurerm_key_vault" "this" {
  for_each                      = var.vaults
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  tenant_id                     = each.value.tenant_id
  sku_name                      = each.value.sku_name
  soft_delete_retention_days    = each.value.soft_delete_retention_days
  purge_protection_enabled      = each.value.purge_protection_enabled
  public_network_access_enabled = each.value.public_network_access_enabled
  rbac_authorization_enabled    = true
  tags                          = each.value.tags
}
