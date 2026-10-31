resource "azurerm_public_ip" "public_ips" {
  for_each = var.public_ips

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
  sku_tier            = each.value.sku_tier
  ip_version          = each.value.ip_version
  domain_name_label   = each.value.domain_name_label
  zones               = each.value.zones
  tags                = each.value.tags
}