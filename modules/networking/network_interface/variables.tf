variable "network_interfaces" {
  description = "Map of Azure network interfaces to create."

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string

    ip_configurations = map(object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = optional(string, "Dynamic")
      private_ip_address            = optional(string)
      public_ip_address_id          = optional(string)
      primary                       = optional(bool, true)
    }))

    enable_accelerated_networking = optional(bool, false)
    enable_ip_forwarding          = optional(bool, false)
    tags                          = optional(map(string), {})
  }))

  nullable = false
}