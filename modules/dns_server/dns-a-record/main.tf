resource "azurerm_dns_a_record" "this" {
  for_each            = var.records
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
  target_resource_id  = each.value.target_resource_id
}
