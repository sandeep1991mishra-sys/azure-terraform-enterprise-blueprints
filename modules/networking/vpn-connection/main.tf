resource "azurerm_virtual_network_gateway_connection" "resource" {
  for_each = nonsensitive(toset(keys(var.resources)))

  name                            = var.resources[each.key].name
  location                        = var.resources[each.key].location
  resource_group_name             = var.resources[each.key].resource_group_name
  type                            = var.resources[each.key].type
  virtual_network_gateway_id      = var.resources[each.key].virtual_network_gateway_id
  peer_virtual_network_gateway_id = var.resources[each.key].peer_virtual_network_gateway_id
  shared_key                      = var.resources[each.key].shared_key
  connection_protocol             = var.resources[each.key].connection_protocol
  tags                            = var.resources[each.key].tags
}
