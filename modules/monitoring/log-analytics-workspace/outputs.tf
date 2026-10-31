output "ids" { value = { for k, v in azurerm_log_analytics_workspace.this : k => v.id } }
output "workspace_ids" { value = { for k, v in azurerm_log_analytics_workspace.this : k => v.workspace_id } }
