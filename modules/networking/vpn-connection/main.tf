resource "azurerm_vpn_connection" "resource" {
  for_each = var.resources

  name                      = each.value.name
  vpn_gateway_id            = each.value.vpn_gateway_id
  remote_vpn_site_id        = each.value.remote_vpn_site_id
  internet_security_enabled = each.value.internet_security_enabled
  tags                      = each.value.tags
}
