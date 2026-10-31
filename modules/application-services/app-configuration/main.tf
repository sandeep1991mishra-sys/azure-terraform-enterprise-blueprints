resource "azurerm_app_configuration" "this" {
  for_each = var.stores
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  local_auth_enabled  = each.value.local_auth_enabled
  public_network_access = each.value.public_network_access
  tags = each.value.tags
}
