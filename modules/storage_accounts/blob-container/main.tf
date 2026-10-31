resource "azurerm_storage_container" "this" {
  for_each = var.containers
  name                  = each.value.name
  storage_account_name  = each.value.storage_account_name
  container_access_type = each.value.container_access_type
  metadata              = each.value.metadata
}
