resource "azurerm_virtual_hub" "resource" {
  for_each = var.resources

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  virtual_wan_id      = each.value.virtual_wan_id
  address_prefix      = each.value.address_prefix
  sku                 = each.value.sku
  tags                = each.value.tags
}
