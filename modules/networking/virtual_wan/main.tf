resource "azurerm_virtual_wan" "virtual_wans" {
  for_each = var.virtual_wans

  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  location               = each.value.location
  type                   = each.value.type
  disable_vpn_encryption = each.value.disable_vpn_encryption
  tags                   = each.value.tags
}
