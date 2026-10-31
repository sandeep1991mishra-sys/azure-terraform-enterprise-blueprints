resource "azurerm_network_manager" "network_managers" {
  for_each = var.network_managers

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  scope_accesses      = each.value.scope_accesses
  tags                = each.value.tags

  dynamic "scope" {
    for_each = [each.value.network_manager_scopes]

    content {
      management_group_ids = scope.value.management_group_ids
      subscription_ids     = scope.value.subscription_ids
    }
  }
}
