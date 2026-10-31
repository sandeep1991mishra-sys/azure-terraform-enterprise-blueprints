output "ids" { value = { for k, v in azurerm_monitor_action_group.this : k => v.id } }
