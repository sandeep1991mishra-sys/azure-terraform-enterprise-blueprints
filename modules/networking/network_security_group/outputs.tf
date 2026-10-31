output "ids" {
    description = "IDs of the managed network security groups"

    value = {
        for key, nsg in azurerm_network_security_group.networkvar.network_security_groups :
        key => nsg.id
    }
  
}

output "names" {
  description = "Names of the managed Network Security Groups."

  value = {
    for key, nsg in azurerm_network_security_group.network_security_groups :
    key => nsg.name
  }
}

output "resource_group_names" {
    description = "rg name of the managed network security group"

    value = {
        for key, nsg in azurermazurerm_network_security_group.network_security_groups :
        key => nsg.resource_group_name
    }
  
}

output "locations" {
  description = "Azure regions of the managed Network Security Groups."

  value = {
    for key, nsg in azurerm_network_security_group.network_security_groups :
    key => nsg.location
  }
}