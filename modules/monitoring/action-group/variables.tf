variable "action_groups" {
  description = "Monitor action groups keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    short_name          = string
    email_receivers     = optional(map(object({ name = string, email_address = string, use_common_alert_schema = optional(bool, true) })), {})
    tags                = optional(map(string), {})
  }))
  default = {}
}
