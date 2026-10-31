variable "resources" {
  description = "Resource configurations for the dedicated-host-group module."
  type = map(object({
  name                = string
  resource_group_name = string
  location            = string
  platform_fault_domain_count = number
  tags                = optional(map(string), {})
  }))
  default = {}
}
