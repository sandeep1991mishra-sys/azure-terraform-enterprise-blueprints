variable "plans" {
  description = "App Service plans keyed by a caller-defined instance key."
  type = map(object({
    name                   = string
    resource_group_name    = string
    location               = string
    os_type                = string
    sku_name               = string
    worker_count           = optional(number)
    zone_balancing_enabled = optional(bool, false)
    tags                   = optional(map(string), {})
  }))
  default = {}
}
