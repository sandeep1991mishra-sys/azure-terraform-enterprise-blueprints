resource "azurerm_monitor_diagnostic_setting" "this" {
  for_each = var.settings
  name                       = each.value.name
  target_resource_id         = each.value.target_resource_id
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  storage_account_id         = each.value.storage_account_id
  dynamic "enabled_log" {
    for_each = each.value.log_categories
    content { category = enabled_log.value }
  }
  dynamic "metric" {
    for_each = each.value.metric_categories
    content {
      category = metric.value
      enabled  = true
    }
  }
}
