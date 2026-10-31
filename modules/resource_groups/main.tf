resource "azurerm_resource_group" "resource_groups" {
  for_each = var.resource_groups
  name     = each.value.resource_group_name
  location = each.value.location
  tags     = each.value.tags

}