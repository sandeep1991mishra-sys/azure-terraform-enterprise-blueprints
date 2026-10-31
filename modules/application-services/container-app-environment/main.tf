resource "azurerm_container_app_environment" "this" {
  for_each                   = var.environments
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
  location                   = each.value.location
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  infrastructure_subnet_id   = each.value.infrastructure_subnet_id
  tags                       = each.value.tags
}
