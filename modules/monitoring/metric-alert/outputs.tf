output "ids" { value = { for k, v in azurerm_monitor_metric_alert.this : k => v.id } }
