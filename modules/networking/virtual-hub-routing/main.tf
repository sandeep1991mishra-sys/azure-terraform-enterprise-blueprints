resource "azurerm_virtual_hub_route_table" "resource" {
  for_each = var.resources

  name           = each.value.name
  virtual_hub_id = each.value.virtual_hub_id
  labels         = each.value.labels

  dynamic "route" {
    for_each = each.value.routes

    content {
      name              = route.value.name
      destinations      = route.value.destinations
      destinations_type = route.value.destinations_type
      next_hop          = route.value.next_hop
      next_hop_type     = route.value.next_hop_type
    }
  }
}
