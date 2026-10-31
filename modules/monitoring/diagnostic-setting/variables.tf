variable "settings" {
  description = "Diagnostic settings keyed by a caller-defined instance key."
  type = map(object({
    name                       = string
    target_resource_id         = string
    log_analytics_workspace_id = optional(string)
    storage_account_id         = optional(string)
    log_categories             = optional(set(string), [])
    metric_categories          = optional(set(string), ["AllMetrics"])
  }))
  default = {}
}
