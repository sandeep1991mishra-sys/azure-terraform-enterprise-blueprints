variable "zones" {
  description = "Public DNS zones keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string), {})
  }))
  default = {}
}
