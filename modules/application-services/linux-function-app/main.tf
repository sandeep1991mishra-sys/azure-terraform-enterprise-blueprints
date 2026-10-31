resource "azurerm_linux_function_app" "this" {
  for_each = var.apps
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
  location                   = each.value.location
  service_plan_id            = each.value.service_plan_id
  storage_account_name       = each.value.storage_account_name
  storage_account_access_key = each.value.storage_account_access_key
  https_only                 = each.value.https_only
  site_config {}
  tags = each.value.tags
}
