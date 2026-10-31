variable "apps" {
  description = "Linux Function Apps keyed by a caller-defined instance key."
  type = map(object({
    name                       = string
    resource_group_name        = string
    location                   = string
    service_plan_id            = string
    storage_account_name       = string
    storage_account_access_key = string
    https_only                 = optional(bool, true)
    tags                       = optional(map(string), {})
  }))
  default = {}
}
