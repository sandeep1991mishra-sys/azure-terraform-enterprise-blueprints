variable "resources" {
  description = "Configurations for the expressroute-gateway module."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    virtual_hub_id      = string
    scale_units         = number
    tags                = optional(map(string), {})
  }))
  default = {}
}
