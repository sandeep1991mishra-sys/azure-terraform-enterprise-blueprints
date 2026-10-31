variable "network_security_perimeters" {
  description = "Map of Azure Network Security Perimeters to create."

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    tags                = optional(map(string), {})
  }))

  nullable = false
}