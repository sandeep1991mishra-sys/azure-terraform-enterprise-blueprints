variable "stores" {
  description = "App Configuration stores keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = optional(string, "standard")
    local_auth_enabled  = optional(bool, false)
    public_network_access = optional(string, "Disabled")
    tags                = optional(map(string), {})
  }))
  default = {}
}
