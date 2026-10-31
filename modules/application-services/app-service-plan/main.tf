resource "azurerm_service_plan" "this" {
  for_each               = var.plans
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  location               = each.value.location
  os_type                = each.value.os_type
  sku_name               = each.value.sku_name
  worker_count           = each.value.worker_count
  zone_balancing_enabled = each.value.zone_balancing_enabled
  tags                   = each.value.tags
}
