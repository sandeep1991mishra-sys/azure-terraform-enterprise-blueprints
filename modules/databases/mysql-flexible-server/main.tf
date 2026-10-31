resource "azurerm_mysql_flexible_server" "this" {
  for_each = var.servers
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  location               = each.value.location
  administrator_login    = each.value.administrator_login
  administrator_password = each.value.administrator_password
  sku_name               = each.value.sku_name
  version                = each.value.version
  backup_retention_days  = each.value.backup_retention_days
  public_network_access  = each.value.public_network_access
  tags = each.value.tags
}
