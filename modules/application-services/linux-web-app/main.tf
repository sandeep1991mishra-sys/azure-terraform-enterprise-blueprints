resource "azurerm_linux_web_app" "this" {
  for_each            = var.apps
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  service_plan_id     = each.value.service_plan_id
  https_only          = each.value.https_only
  app_settings        = each.value.app_settings
  site_config {}
  tags = each.value.tags
}
