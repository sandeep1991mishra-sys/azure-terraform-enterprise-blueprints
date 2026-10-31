resource "azurerm_shared_image" "resource" {
  for_each = var.resources

  name                = each.value.name
  gallery_name        = each.value.gallery_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  os_type             = each.value.os_type
  identifier {
    publisher = each.value.identifier_publisher
    offer     = each.value.identifier_offer
    sku       = each.value.identifier_sku
  }
  tags = each.value.tags
}
