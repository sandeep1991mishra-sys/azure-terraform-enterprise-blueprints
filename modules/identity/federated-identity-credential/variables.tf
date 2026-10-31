variable "credentials" {
  description = "Federated identity credentials keyed by a caller-defined instance key."

  type = map(object({
    name                      = string
    user_assigned_identity_id = string
    audience                  = list(string)
    issuer                    = string
    subject                   = string
  }))

  default = {}
}
