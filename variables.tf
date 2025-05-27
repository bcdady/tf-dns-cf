variable "cf_api_token" {
  type        = string
  description = "Cloudflare API token."
  validation {
    condition     = can(regex("^\\S{40}$", var.cf_api_token))
    error_message = "Cloudflare API token must be a 40-character string."
  }
}
