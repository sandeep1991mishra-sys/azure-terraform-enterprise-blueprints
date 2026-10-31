resource "azurerm_capacity_reservation" "resource" {
  for_each = var.resources

  name                          = each.value.name
  capacity_reservation_group_id = each.value.capacity_reservation_group_id
  tags                          = each.value.tags

  sku {
    name     = each.value.sku.name
    capacity = each.value.sku.capacity
  }
}
