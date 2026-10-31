variable "resources" {
  description = "Configurations for the azure-firewall module."
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    sku_name              = optional(string, "AZFW_VNet")
    sku_tier              = optional(string, "Standard")
    firewall_policy_id    = optional(string)
    ip_configuration_name = string
    subnet_id             = string
    public_ip_address_id  = string
    tags                  = optional(map(string), {})
  }))
  default = {}
}
