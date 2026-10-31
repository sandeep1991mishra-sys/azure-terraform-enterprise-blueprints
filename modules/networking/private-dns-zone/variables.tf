variable "resources" {
  description = "Configurations for the private-dns-zone module."
  type = map(object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string), {})
  }))
  default = {}
}
