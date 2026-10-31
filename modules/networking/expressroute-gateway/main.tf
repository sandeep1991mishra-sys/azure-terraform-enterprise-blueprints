resource "azurerm_express_route_gateway" "resource" {
  for_each = var.resources

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  virtual_hub_id      = each.value.virtual_hub_id
  scale_units         = each.value.scale_units
  tags                = each.value.tags
}
