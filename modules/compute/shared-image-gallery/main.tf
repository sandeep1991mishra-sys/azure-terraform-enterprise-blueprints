resource "azurerm_shared_image_gallery" "resource" {
  for_each = var.resources

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  description         = each.value.description
  tags                = each.value.tags
}
