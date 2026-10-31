variable "apps" {
  description = "Windows Web Apps keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    service_plan_id     = string
    https_only          = optional(bool, true)
    app_settings        = optional(map(string), {})
    tags                = optional(map(string), {})
  }))
  default = {}
}
