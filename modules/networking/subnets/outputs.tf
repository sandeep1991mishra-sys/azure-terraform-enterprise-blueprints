output "ids" {
    description = "IDs of the managed subnets"

    value = {
        for key, subnet in azurerm_subnet.var.subnets :
        key => subnet.id
    }
  
}

output "name" {
    description = "name of managed subnets"

    value = {
        for key, subnet in azurerm_subnet.subnets :
        key => subnet.name
    }
  
}

output "address_prefixes" {
    description = "address prefixes of managed subnets"

    value = {
        for key, subnet in azurerm_subnet.subnets :
        key => subnet.address_prefixes
    }
}

output "virtual_network_name" {
    description = "virtual network name in managed subnets"

    value = {
        for key, subnet in azurerm_subnet.subnets :
        key => subnet.virtual_network_name
    }
  
}