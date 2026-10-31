resource "azurerm_local_network_gateway" "resource" {
  for_each = var.resources

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  gateway_address     = each.value.gateway_address
  address_space       = each.value.address_space
  tags                = each.value.tags
}
