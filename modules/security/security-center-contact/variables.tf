variable "contacts" {
  description = "Microsoft Defender for Cloud security contacts keyed by a caller-defined instance key."
  type = map(object({
    email = string
    phone = optional(string)
    alert_notifications = optional(bool, true)
    alerts_to_admins    = optional(bool, true)
  }))
  default = {}
}
