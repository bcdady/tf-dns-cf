variable "zone_name" {
  type        = string
  description = "The name of the DNS zone to be managed."
}

variable "account_id" {
  type        = string
  description = "Cloudflare account ID to manage the zone resource in"
}

variable "zone_enabled" {
  type        = bool
  description = "Whether to create a DNS zone. Otherwise, use existing."
  default     = false
}

variable "records" {
  type        = list(any)
  default     = []
  description = <<-DOC
    name:
      The name of the record.
    type:
      The type of the record.
    content:
      The value of the record.
    comment:
      Optional comment for the record.
    ttl:
      The TTL of the record.
      Default value: 1.
    priority:
      The priority of the record.
    proxied:
      Whether the record gets Cloudflare's origin protection.
      Default value: false.
  DOC
}

variable "paused" {
  type        = bool
  description = "Whether this zone is paused (traffic bypasses Cloudflare)"
  default     = false
}

variable "jump_start" {
  type        = bool
  description = "Whether to scan for DNS records on creation."
  default     = false
}

variable "plan" {
  type        = string
  description = "The name of the commercial plan to apply to the zone. Possible values: `free`, `pro`, `business`, `enterprise`"
  default     = "free"

  validation {
    condition     = var.plan == null ? true : contains(["free", "pro", "business", "enterprise"], var.plan)
    error_message = "Allowed values: `free`, `pro`, `business`, `enterprise`."
  }
}

variable "type" {
  type        = string
  description = "A full zone implies that DNS is hosted with Cloudflare. A `partial` zone is typically a partner-hosted zone or a CNAME setup. Possible values: `full`, `partial`."
  default     = "full"

  validation {
    condition     = var.type == null ? true : contains(["full", "partial"], var.type)
    error_message = "Allowed values: `full`, `partial`."
  }
}


