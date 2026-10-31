variable "virtual_wans" {
  description = "Map of Azure Virtual WAN resources to create."

  type = map(object({
    name                   = string
    resource_group_name    = string
    location               = string
    type                   = optional(string, "Standard")
    disable_vpn_encryption = optional(bool, false)
    tags                   = optional(map(string), {})
  }))

  nullable = false
}
