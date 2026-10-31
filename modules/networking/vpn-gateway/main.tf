resource "azurerm_vpn_gateway" "resource" {
  for_each = var.resources

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  virtual_hub_id      = each.value.virtual_hub_id
  tags                = each.value.tags
}
