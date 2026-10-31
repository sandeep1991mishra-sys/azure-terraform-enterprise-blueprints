resource "azurerm_availability_set" "resource" {
  for_each = var.resources

  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  platform_fault_domain_count  = each.value.platform_fault_domain_count
  platform_update_domain_count = each.value.platform_update_domain_count
  managed                      = each.value.managed
  tags                         = each.value.tags
}
