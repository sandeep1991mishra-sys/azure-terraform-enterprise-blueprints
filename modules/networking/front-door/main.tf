resource "azurerm_cdn_frontdoor_profile" "resource" {
  for_each = var.resources

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  tags                = each.value.tags
}
