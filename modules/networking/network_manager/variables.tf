variable "network_managers" {
  description = "Map of Azure Virtual Network Managers to create."

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    scope_accesses      = set(string)
    network_manager_scopes = object({
      management_group_ids = optional(set(string), [])
      subscription_ids     = optional(set(string), [])
    })
    tags = optional(map(string), {})
  }))

  nullable = false
}
