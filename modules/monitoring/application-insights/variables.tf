variable "components" {
  description = "Application Insights components keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    application_type    = string
    workspace_id        = optional(string)
    retention_in_days   = optional(number, 90)
    tags                = optional(map(string), {})
  }))
  default = {}
}
