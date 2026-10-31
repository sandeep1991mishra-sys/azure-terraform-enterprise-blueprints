resource "azurerm_private_endpoint" "resource" {
  for_each = var.resources

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = each.value.subnet_id
  private_service_connection {
    name                           = each.value.connection_name
    private_connection_resource_id = each.value.private_connection_resource_id
    is_manual_connection           = each.value.is_manual_connection
    subresource_names              = each.value.subresource_names
  }
  tags = each.value.tags
}
