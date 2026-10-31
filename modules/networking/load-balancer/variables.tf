variable "resources" {
  description = "Configurations for the load-balancer module."
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    sku                  = optional(string, "Standard")
    frontend_name        = string
    subnet_id            = optional(string)
    public_ip_address_id = optional(string)
    tags                 = optional(map(string), {})
  }))
  default = {}
}
