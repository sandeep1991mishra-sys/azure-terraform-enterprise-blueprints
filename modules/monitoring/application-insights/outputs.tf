output "ids" { value = { for k, v in azurerm_application_insights.this : k => v.id } }
output "connection_strings" {
  value     = { for k, v in azurerm_application_insights.this : k => v.connection_string }
  sensitive = true
}
