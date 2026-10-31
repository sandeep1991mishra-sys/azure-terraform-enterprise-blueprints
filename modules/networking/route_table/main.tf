resource "azurerm_route_table" "route_tables" {
  for_each = var.route_tables

  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  bgp_route_propagation_enabled = each.value.bgp_route_propagation_enabled
  tags                          = each.value.tags
}
