resource "azurerm_subnet_network_security_group_association" "associations" {
  for_each = var.subnet_nsg_associations

  subnet_id                 = each.value.subnet_id                 # in which subnet need to attach NSG
  network_security_group_id = each.value.network_security_group_id # NSG's ID going to be attached
}
