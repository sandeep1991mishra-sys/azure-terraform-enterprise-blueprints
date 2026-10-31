resource "azurerm_storage_queue" "this" {
  for_each = var.queues
  name                 = each.value.name
  storage_account_name = each.value.storage_account_name
  metadata             = each.value.metadata
}
