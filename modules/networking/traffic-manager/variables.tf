variable "resources" {
  description = "Configurations for the traffic-manager module."
  type = map(object({
    name                   = string
    resource_group_name    = string
    traffic_routing_method = string
    relative_name          = string
    ttl                    = optional(number, 100)
    monitor_protocol       = optional(string, "HTTPS")
    monitor_port           = optional(number, 443)
    monitor_path           = optional(string, "/")
    tags                   = optional(map(string), {})
  }))
  default = {}
}
