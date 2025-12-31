locals {
  zone_enabled    = var.zone_enabled
  zone_exists     = !var.zone_enabled
  records_enabled = length(var.records) > 0
  zone_id         = local.zone_enabled ? join("", cloudflare_zone.default[*].id) : (local.zone_exists ? data.cloudflare_zones.default[0].zones[0].id : null)
  records = local.records_enabled ? {
    for index, record in var.records :
    try(record.key, format("%s-%s-%d", record.name, record.type, index)) => record
  } : {}
}

data "cloudflare_zones" "default" {
  count = local.zone_exists ? 1 : 0
  name  = var.zone_name
}

resource "cloudflare_zone" "default" {
  count = local.zone_enabled ? 1 : 0

  name = var.zone_name

  account = {
    id = var.account_id
  }

  paused = var.paused
  type   = var.type
}

resource "cloudflare_dns_record" "default" {
  for_each = local.records

  zone_id  = local.zone_id
  name     = each.value.name
  type     = each.value.type
  content  = each.value.content
  comment  = lookup(each.value, "comment", null)
  priority = lookup(each.value, "priority", null)
  proxied  = lookup(each.value, "proxied", false)
  ttl      = lookup(each.value, "ttl", 1)
}
