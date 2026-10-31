variable "resources" {
  description = "Configurations for the vpn-connection module."
  type = map(object({
    name                      = string
    vpn_gateway_id            = string
    remote_vpn_site_id        = string
    internet_security_enabled = optional(bool, false)
    tags                      = optional(map(string), {})
  }))
  default = {}
}
