resource "azurerm_recovery_services_vault" "this" {
  for_each            = var.vaults
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  tags                = each.value.tags
}
