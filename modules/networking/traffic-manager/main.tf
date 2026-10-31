resource "azurerm_traffic_manager_profile" "resource" {
  for_each = var.resources

  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  traffic_routing_method = each.value.traffic_routing_method
  dns_config {
    relative_name = each.value.relative_name
    ttl           = each.value.ttl
  }
  monitor_config {
    protocol                     = each.value.monitor_protocol
    port                         = each.value.monitor_port
    path                         = each.value.monitor_path
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }
  tags = each.value.tags
}
