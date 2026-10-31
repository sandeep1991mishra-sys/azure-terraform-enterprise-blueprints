resource "azurerm_network_ddos_protection_plan" "ddos_protection_plans" {
  for_each = var.ddos_protection_plans

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = each.value.tags
}