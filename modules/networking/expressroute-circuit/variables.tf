variable "resources" {
  description = "Configurations for the expressroute-circuit module."
  type = map(object({
    name                  = string
    resource_group_name   = string
    location              = string
    service_provider_name = string
    peering_location      = string
    bandwidth_in_mbps     = number
    sku_tier              = string
    sku_family            = string
    tags                  = optional(map(string), {})
  }))
  default = {}
}
