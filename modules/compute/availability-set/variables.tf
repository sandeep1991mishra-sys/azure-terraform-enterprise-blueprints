variable "resources" {
  description = "Resource configurations for the availability-set module."
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    platform_fault_domain_count  = optional(number, 2)
    platform_update_domain_count = optional(number, 5)
    managed                      = optional(bool, true)
    tags                         = optional(map(string), {})
  }))
  default = {}
}
