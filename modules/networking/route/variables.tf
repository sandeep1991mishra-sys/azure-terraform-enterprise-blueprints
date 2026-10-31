variable "routes" {
  description = "Map of routes to create in Azure Route Tables."

  type = map(object({
    name                   = string
    resource_group_name    = string
    route_table_name       = string           # Existing Route Table name
    address_prefix         = string           # Destination network
    next_hop_type          = string           # where Traffic to be forwarded, like VnetLocal, Internet, VirtualAppliance
    next_hop_in_ip_address = optional(string) # Next-hop appliance IP; when applicable
  }))

  nullable = false
}
