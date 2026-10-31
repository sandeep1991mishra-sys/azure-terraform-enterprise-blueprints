resource "azurerm_private_dns_zone" "resource" {
  for_each = var.resources

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
