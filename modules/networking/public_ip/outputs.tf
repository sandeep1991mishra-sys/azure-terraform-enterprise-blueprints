output "ids" {
  description = "Map of Azure Public IP resource IDs."
  value       = { 
    for key, public_ip in azurerm_public_ip.public_ips : 
    key => public_ip.id 
    }
}

output "names" {
  description = "Map of Azure Public IP names."
  value       = { 
    for key, public_ip in azurerm_public_ip.public_ips : 
    key => public_ip.name 
    }
}

output "ip_addresses" {
  description = "Map of assigned public IP addresses."
  value       = { 
    for key, public_ip in azurerm_public_ip.public_ips : 
    key => public_ip.ip_address 
    }
}

output "fqdns" {
  description = "Map of Public IP fully qualified domain names, when available."
  value       = { for key, public_ip in azurerm_public_ip.public_ips : key => public_ip.fqdn }
}

output "locations" {
  description = "Map of Azure regions."
  value       = { for key, public_ip in azurerm_public_ip.public_ips : key => public_ip.location }
}