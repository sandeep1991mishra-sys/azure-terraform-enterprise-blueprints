variable "resources" {
  description = "Resource configurations for the dedicated-host module."
  type = map(object({
  name             = string
  host_group_id    = string
  sku_name         = string
  platform_fault_domain = number
  tags             = optional(map(string), {})
  }))
  default = {}
}
