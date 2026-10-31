resource "azurerm_private_link_service" "resource" {
  for_each = var.resources

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  load_balancer_frontend_ip_configuration_ids = each.value.load_balancer_frontend_ip_configuration_ids
  nat_ip_configuration {
    name      = each.value.nat_ip_name
    primary   = true
    subnet_id = each.value.nat_subnet_id
  }
  tags = each.value.tags
}
