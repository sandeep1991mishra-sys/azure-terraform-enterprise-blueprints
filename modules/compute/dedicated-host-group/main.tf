resource "azurerm_host_group" "resource" {
  for_each = var.resources

  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  location                    = each.value.location
  platform_fault_domain_count = each.value.platform_fault_domain_count
  tags                        = each.value.tags
}
