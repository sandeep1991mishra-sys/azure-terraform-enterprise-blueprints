resource "azurerm_cosmosdb_account" "this" {
  for_each = var.accounts
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  offer_type          = each.value.offer_type
  kind                = each.value.kind
  consistency_policy { consistency_level = each.value.consistency_level }
  dynamic "geo_location" {
    for_each = each.value.geo_locations
    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
    }
  }
  automatic_failover_enabled = each.value.automatic_failover_enabled
  public_network_access_enabled = each.value.public_network_access_enabled
  tags = each.value.tags
}
