resource "azurerm_bastion_host" "resource" {
  for_each = var.resources

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = each.value.subnet_id
    public_ip_address_id = each.value.public_ip_address_id
  }
  tags = each.value.tags
}
