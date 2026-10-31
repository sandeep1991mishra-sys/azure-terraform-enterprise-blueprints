variable "resources" {
  description = "Resource configurations for the proximity-placement-group module."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    tags                = optional(map(string), {})
  }))
  default = {}
}
