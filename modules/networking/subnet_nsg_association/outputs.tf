output "ids" {
  description = "IDs of the subnet-to-NSG associations."

  value = {
    for key, association in azurerm_subnet_network_security_group_association.associations :
    key => association.id
  }
}

output "subnet_ids" {
  description = "IDs of the associated subnets."

  value = {
    for key, association in azurerm_subnet_network_security_group_association.associations :
    key => association.subnet_id
  }
}

output "network_security_group_ids" {
  description = "IDs of the associated Network Security Groups."

  value = {
    for key, association in azurerm_subnet_network_security_group_association.associations :
    key => association.network_security_group_id
  }
}
