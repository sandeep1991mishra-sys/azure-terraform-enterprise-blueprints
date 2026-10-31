resource "azurerm_virtual_network_peering" "vnet_peerings" {
  for_each = var.vnet_peerings

  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name      # local vnet
  remote_virtual_network_id = each.value.remote_virtual_network_id # remote vnet going to be peered

  allow_virtual_network_access = each.value.allow_virtual_network_access
  allow_forwarded_traffic      = each.value.allow_forwarded_traffic
  allow_gateway_transit        = each.value.allow_gateway_transit
  use_remote_gateways          = each.value.use_remote_gateways

  triggers = each.value.triggers
}