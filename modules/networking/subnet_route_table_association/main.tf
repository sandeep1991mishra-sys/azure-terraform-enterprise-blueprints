resource "azurerm_subnet_route_table_association" "associations" {
  for_each = var.subnet_route_table_associations

  subnet_id      = each.value.subnet_id      # identify target subnet
  route_table_id = each.value.route_table_id # identify routing table applying on subnet
}