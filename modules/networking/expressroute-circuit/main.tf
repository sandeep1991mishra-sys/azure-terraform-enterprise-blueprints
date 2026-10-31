resource "azurerm_express_route_circuit" "resource" {
  for_each = var.resources

  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  service_provider_name = each.value.service_provider_name
  peering_location      = each.value.peering_location
  bandwidth_in_mbps     = each.value.bandwidth_in_mbps
  sku {
    tier   = each.value.sku_tier
    family = each.value.sku_family
  }
  tags = each.value.tags
}
