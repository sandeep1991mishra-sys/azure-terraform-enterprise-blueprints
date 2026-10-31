variable "accounts" {
  description = "Cosmos DB accounts keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    offer_type          = optional(string, "Standard")
    kind                = optional(string, "GlobalDocumentDB")
    consistency_level   = optional(string, "Session")
    geo_locations       = list(object({ location = string, failover_priority = number }))
    automatic_failover_enabled = optional(bool, true)
    public_network_access_enabled = optional(bool, false)
    tags = optional(map(string), {})
  }))
  default = {}
}
