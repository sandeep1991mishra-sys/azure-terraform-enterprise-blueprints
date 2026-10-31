variable "network_security_groups" {
  description = "map of azure network security group to create"

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    tags                = optional(map(string), {})
  }))

}