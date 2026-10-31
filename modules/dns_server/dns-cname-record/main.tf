resource "azurerm_dns_cname_record" "this" {
  for_each = var.records
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
}
