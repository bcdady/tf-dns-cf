output "zone_id" {
  description = "The zone ID."
  value       = try(local.zone_id, null)
}

output "record_names_to_ids" {
  description = "A map of the zone record names to IDs."
  value = {
    for record in cloudflare_dns_record.default :
    record.name => record.id...
    if local.records_enabled
  }
}

output "vanity_name_servers" {
  description = "A list of Vanity Nameservers."
  value       = try(cloudflare_zone.default[*].vanity_name_servers, null)
}

output "meta_phishing_detected" {
  description = "Indicates if URLs on the zone have been identified as hosting phishing content."
  value       = join("", cloudflare_zone.default[*].meta.phishing_detected)
}

output "status" {
  description = "Status of the zone."
  value       = join("", cloudflare_zone.default[*].status)
}

output "name_servers" {
  description = "A list of Cloudflare-assigned name servers. This is only populated for zones that use Cloudflare DNS."
  value       = try(cloudflare_zone.default[*].name_servers, null)
}

output "verification_key" {
  description = "Contains the TXT record value to validate domain ownership. This is only populated for zones of type `partial`."
  value       = try(join("", cloudflare_zone.default[*].verification_key), null)
}
