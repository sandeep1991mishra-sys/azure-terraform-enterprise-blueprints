variable "resources" {
  description = "Configurations for the private-link-service module."
  type = map(object({
    name                                        = string
    location                                    = string
    resource_group_name                         = string
    load_balancer_frontend_ip_configuration_ids = list(string)
    nat_ip_name                                 = string
    nat_subnet_id                               = string
    tags                                        = optional(map(string), {})
  }))
  default = {}
}
