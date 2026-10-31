resource "azurerm_network_security_rule" "nsg_rules" {
  for_each = var.nsg_rules

  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  network_security_group_name = each.value.network_security_group_name
  priority                    = each.value.priority                      # defines behaviour of rules
  direction                   = each.value.direction                     # defines behaviour of rules
  access                      = each.value.access                        # defines behaviour of rules
  protocol                    = each.value.protocol                      # defines behaviour of rules

  source_port_ranges           = each.value.source_port_ranges           #traffic is allowed from which from which source to which destination
  destination_port_ranges      = each.value.destination_port_ranges      #traffic is allowed from which from which source to which destination
  source_address_prefixes      = each.value.source_address_prefixes      #traffic is allowed from which from which source to which destination
  destination_address_prefixes = each.value.destination_address_prefixes #traffic is allowed from which from which source to which destination

  description = each.value.description
}
