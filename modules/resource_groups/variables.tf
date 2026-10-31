variable "resource_groups" {
  description = "Map of Azure resource groups to create."

  type = map(object({
    resource_group_name = string
    location            = string
    tags                = optional(map(string), {})
  }))
}
