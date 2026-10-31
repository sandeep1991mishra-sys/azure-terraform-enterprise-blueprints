variable "environments" {
  description = "Container App Environments keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    log_analytics_workspace_id = optional(string)
    infrastructure_subnet_id = optional(string)
    tags                = optional(map(string), {})
  }))
  default = {}
}
