resource "azurerm_monitor_metric_alert" "this" {
  for_each = var.alerts
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  scopes              = each.value.scopes
  description         = each.value.description
  severity            = each.value.severity
  frequency           = each.value.frequency
  window_size         = each.value.window_size
  criteria {
    metric_namespace = each.value.criteria.metric_namespace
    metric_name      = each.value.criteria.metric_name
    aggregation      = each.value.criteria.aggregation
    operator         = each.value.criteria.operator
    threshold        = each.value.criteria.threshold
  }
  dynamic "action" {
    for_each = each.value.action_group_ids
    content { action_group_id = action.value }
  }
  tags = each.value.tags
}
