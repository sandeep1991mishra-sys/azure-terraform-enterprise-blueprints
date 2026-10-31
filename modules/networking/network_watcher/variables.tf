variable "network_watchers" {
  description = "Map of Azure Network Watchers to create."

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    tags                = optional(map(string), {})
  }))

  nullable = false
}