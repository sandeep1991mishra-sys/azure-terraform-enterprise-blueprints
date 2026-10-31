resource "azurerm_network_security_perimeter" "perimeters" {
  for_each = var.network_security_perimeters

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = each.value.tags
}