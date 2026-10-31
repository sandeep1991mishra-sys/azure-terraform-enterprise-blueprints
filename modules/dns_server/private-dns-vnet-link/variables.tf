variable "links" {
  description = "Private DNS zone VNet links keyed by a caller-defined instance key."

  type = map(object({
    name                 = string
    private_dns_zone_id  = string
    virtual_network_id   = string
    registration_enabled = optional(bool, false)
    tags                 = optional(map(string), {})
  }))

  default = {}
}
