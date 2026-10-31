
variable "nsg_rules" {
  description = "Map of Azure Network Security Group rules to create."

  type = map(object({
    name                         = string
    resource_group_name          = string
    network_security_group_name  = string
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_ranges           = optional(list(string), ["*"])
    destination_port_ranges      = optional(list(string), ["*"])
    source_address_prefixes      = optional(list(string), ["*"])
    destination_address_prefixes = optional(list(string), ["*"])
    description                  = optional(string)
  }))

  nullable = false
}
