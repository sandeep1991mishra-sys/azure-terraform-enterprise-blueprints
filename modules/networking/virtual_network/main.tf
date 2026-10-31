resource "azurerm_virtual_network" "virtual_networks" {
  for_each = var.virtual_networks

  name                = each.value.virtaul_network_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers
  tags                = each.value.tags
}
