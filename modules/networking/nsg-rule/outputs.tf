output "ids" {
    description = "ids of managed managed nsg rule"

    value = {
        for key, rule in azurermazurerm_network_security_rule.nsg_rules :
        key => rule.id
    }
  
}

output "name" {
    description = "name of managed nsg rule"

    value = {
        for key, rule in azuremazurerm_network_security_rule.nsg_rules :
        key => rule.name
    }
  
}

output "priorities" {
  description = "Priorities of the managed Network Security Rules."

  value = {
    for key, rule in azurerm_network_security_rule.nsg_rules :
    key => rule.priority
  }
}

output "network_security_group_names" {
  description = "NSGs containing the managed rules."

  value = {
    for key, rule in azurerm_network_security_rule.nsg_rules :
    key => rule.network_security_group_name
  }
}