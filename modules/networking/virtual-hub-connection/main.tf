resource "azurerm_virtual_hub_connection" "resource" {
  for_each = var.resources

  name                      = each.value.name
  virtual_hub_id            = each.value.virtual_hub_id
  remote_virtual_network_id = each.value.remote_virtual_network_id

  internet_security_enabled = each.value.internet_security_enabled

  dynamic "routing" {
    for_each = each.value.routing[*]

    content {
      associated_route_table_id = routing.value.associated_route_table_id
      inbound_route_map_id      = routing.value.inbound_route_map_id
      outbound_route_map_id     = routing.value.outbound_route_map_id

      static_vnet_propagate_static_routes_enabled = routing.value.static_vnet_propagate_static_routes_enabled
    }
  }
}