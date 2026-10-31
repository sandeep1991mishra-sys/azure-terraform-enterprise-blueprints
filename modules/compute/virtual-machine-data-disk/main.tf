resource "azurerm_managed_disk" "resource" {
  for_each = var.resources

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  location             = each.value.location
  disk_size_gb         = each.value.disk_size_gb
  storage_account_type = each.value.storage_account_type
  create_option        = "Empty"
  tags                 = each.value.tags
}
