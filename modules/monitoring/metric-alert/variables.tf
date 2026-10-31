variable "alerts" {
  description = "Metric alerts keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    scopes              = list(string)
    description         = string
    severity            = number
    frequency           = string
    window_size         = string
    criteria = object({
      metric_namespace = string
      metric_name      = string
      aggregation      = string
      operator         = string
      threshold        = number
    })
    action_group_ids = optional(list(string), [])
    tags             = optional(map(string), {})
  }))
  default = {}
}
