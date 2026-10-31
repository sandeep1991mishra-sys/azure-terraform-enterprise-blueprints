resource "azurerm_user_assigned_identity" "this" {
  for_each            = var.identities
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = each.value.tags
}
