resource "azurerm_application_insights" "this" {
  for_each = var.components
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  application_type    = each.value.application_type
  workspace_id        = each.value.workspace_id
  retention_in_days   = each.value.retention_in_days
  tags = each.value.tags
}
