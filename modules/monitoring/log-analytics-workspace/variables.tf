variable "workspaces" {
  description = "Log Analytics workspaces keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = optional(string, "PerGB2018")
    retention_in_days   = optional(number, 30)
    daily_quota_gb      = optional(number, -1)
    tags                = optional(map(string), {})
  }))
  default = {}
}
