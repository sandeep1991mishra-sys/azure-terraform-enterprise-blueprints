variable "public_ips" {
  description = "Map of Azure Public IP addresses to create."

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = optional(string, "Standard")
    sku_tier            = optional(string, "Regional")
    ip_version          = optional(string, "IPv4")
    domain_name_label   = optional(string)
    zones               = optional(list(string))
    tags                = optional(map(string), {})
  }))

  nullable = false
}