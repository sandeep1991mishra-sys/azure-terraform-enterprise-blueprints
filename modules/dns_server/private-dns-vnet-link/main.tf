resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each             = var.links
  name                 = each.value.name
  private_dns_zone_id  = each.value.private_dns_zone_id
  virtual_network_id   = each.value.virtual_network_id
  registration_enabled = each.value.registration_enabled
  tags                 = each.value.tags
}
