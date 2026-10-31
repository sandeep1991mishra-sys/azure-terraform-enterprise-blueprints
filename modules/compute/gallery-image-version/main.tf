resource "azurerm_shared_image_version" "resource" {
  for_each = var.resources

  name                = each.value.name
  image_name          = each.value.image_name
  gallery_name        = each.value.gallery_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  managed_image_id    = each.value.managed_image_id

  dynamic "target_region" {
    for_each = each.value.target_regions
    content {
      name                   = target_region.value
      regional_replica_count = 1
    }
  }
}
