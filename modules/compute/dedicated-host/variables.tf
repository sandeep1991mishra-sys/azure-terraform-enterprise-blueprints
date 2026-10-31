variable "resources" {
  description = "Dedicated Host configurations keyed by caller-defined instance keys."

  type = map(object({
    name                    = string
    location                = string
    dedicated_host_group_id = string
    sku_name                = string
    platform_fault_domain   = number
    tags                    = optional(map(string), {})
  }))

  default = {}
}
