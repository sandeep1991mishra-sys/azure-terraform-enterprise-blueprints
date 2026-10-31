
variable "virtual_networks" {
  description = "Map of Azure virtual networks to create."

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    dns_servers         = optional(list(string), [])
    tags                = optional(map(string), {})
  }))

  nullable = false
}
