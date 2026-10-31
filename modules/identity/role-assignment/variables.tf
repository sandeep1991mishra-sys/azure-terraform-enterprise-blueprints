variable "assignments" {
  description = "Role assignments keyed by a caller-defined instance key."
  type = map(object({
    scope                = string
    role_definition_name = string
    principal_id         = string
    description          = optional(string)
  }))
  default = {}
}
