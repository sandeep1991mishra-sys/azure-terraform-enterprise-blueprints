variable "vnet_peerings" {
  description = "Map of Azure Virtual Network peerings to create."

  type = map(object({
    name                      = string
    resource_group_name       = string
    virtual_network_name      = string
    remote_virtual_network_id = string

    allow_virtual_network_access = optional(bool, true)
    allow_forwarded_traffic      = optional(bool, false)
    allow_gateway_transit        = optional(bool, false)
    use_remote_gateways          = optional(bool, false)

    triggers = optional(map(string), {})
  }))

  nullable = false
}