variable "ddos_protection_plans" {
  description = "Map of Azure DDoS Protection Plans to create."

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    tags                = optional(map(string), {})
  }))

  nullable = false
}