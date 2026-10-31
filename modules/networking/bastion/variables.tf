variable "resources" {
  description = "Configurations for the bastion module."
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    sku                   = optional(string, "Basic")
    ip_configuration_name = optional(string, "configuration")
    subnet_id             = string
    public_ip_address_id  = string
    tags                  = optional(map(string), {})
  }))
  default = {}
}
