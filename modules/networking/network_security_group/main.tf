resource "azurerm_network_security_group" "network_security_groups" {
    for_each = var.network_security_groups

    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    tags = each.value.tags

}