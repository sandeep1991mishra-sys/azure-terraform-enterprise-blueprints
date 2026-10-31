variable "roles" {
  description = "Custom RBAC roles keyed by a caller-defined instance key."
  type = map(object({
    role_name       = string
    scope            = string
    description      = string
    permissions = list(object({
      actions          = list(string)
      not_actions      = optional(list(string), [])
      data_actions     = optional(list(string), [])
      not_data_actions = optional(list(string), [])
    }))
    assignable_scopes = list(string)
  }))
  default = {}
}
