resource "azurerm_network_interface" "network_interfaces" {
  for_each = var.network_interfaces

  name                           = each.value.name
  resource_group_name            = each.value.resource_group_name
  location                       = each.value.location
  accelerated_networking_enabled = each.value.enable_accelerated_networking
  ip_forwarding_enabled          = each.value.enable_ip_forwarding
  tags                           = each.value.tags

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = ip_configuration.value.subnet_id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      private_ip_address            = ip_configuration.value.private_ip_address
      public_ip_address_id          = ip_configuration.value.public_ip_address_id
      primary                       = ip_configuration.value.primary
    }
  }
}
