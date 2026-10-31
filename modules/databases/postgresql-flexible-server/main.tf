resource "azurerm_postgresql_flexible_server" "this" {
  for_each = var.servers
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  location               = each.value.location
  version                = each.value.version
  administrator_login    = each.value.administrator_login
  administrator_password = each.value.administrator_password
  sku_name               = each.value.sku_name
  storage_mb             = each.value.storage_mb
  backup_retention_days  = each.value.backup_retention_days
  zone                   = each.value.zone
  public_network_access  = each.value.public_network_access_enabled
  tags = each.value.tags
}
