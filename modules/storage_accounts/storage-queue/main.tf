resource "azurerm_storage_queue" "this" {
  for_each           = var.queues
  name               = each.value.name
  storage_account_id = each.value.storage_account_id
  metadata           = each.value.metadata
}
