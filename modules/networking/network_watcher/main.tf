resource "azurerm_network_watcher" "network_watchers" {
  for_each = var.network_watchers

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = each.value.tags
}