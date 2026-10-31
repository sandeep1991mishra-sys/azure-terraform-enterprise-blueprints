resource "azurerm_dedicated_host" "resource" {
  for_each = var.resources

  name                    = each.value.name
  location                = each.value.location
  dedicated_host_group_id = each.value.dedicated_host_group_id
  sku_name                = each.value.sku_name
  platform_fault_domain   = each.value.platform_fault_domain
  tags                    = each.value.tags
}
