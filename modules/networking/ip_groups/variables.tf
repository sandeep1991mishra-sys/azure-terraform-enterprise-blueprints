variable "ip_groups" {
  description = "Map of Azure IP Groups to create."

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    cidrs               = list(string)
    tags                = optional(map(string), {})
  }))

  nullable = false
}