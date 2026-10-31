variable "resources" {
  description = "Configurations for the application-gateway module."
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    sku_name = optional(string, "Standard_v2")
    sku_tier = optional(string, "Standard_v2")
    capacity = optional(number, 2)
    gateway_ip_configuration_name = string
    subnet_id = string
    frontend_port_name = string
    frontend_port = optional(number, 80)
    frontend_ip_name = string
    public_ip_address_id = string
    backend_pool_name = string
    backend_settings_name = string
    backend_port = optional(number, 80)
    listener_name = string
    routing_rule_name = string
    tags = optional(map(string), {})
  }))
  default = {}
}
