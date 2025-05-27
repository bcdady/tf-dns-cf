terraform {
  required_version = "~> 1.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.5"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.8"
    }
  }
}
