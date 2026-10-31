variable "resources" {
  description = "Configurations for the private-dns-zone-vnet-link module."
  type = map(object({
    name = string
    resource_group_name = string
    private_dns_zone_name = string
    virtual_network_id = string
    registration_enabled = optional(bool, false)
    tags = optional(map(string), {})
  }))
  default = {}
}
