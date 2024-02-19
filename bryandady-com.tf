module "bryandady-com" {
  source  = "cloudposse/zone/cloudflare"
  version = "0.5.1"

  account_id = local.account_id
  zone       = "bryandady.com"

  records = [
    {
      name    = "@"
      ttl     = 300
      type    = "TXT"
      value   = "v=spf1 -all"
    },
    {
      name    = "_dmarc"
      ttl     = 300
      type    = "TXT"
      value   = local.dmarc_quarantine
    },
    {
      name    = "@"
      value   = "bcdady.pages.dev"
      proxied = true
      type    = "CNAME"
    },
    {
      name    = "www"
      value   = "bcdady.pages.dev"
      proxied = true
      type    = "CNAME"
    }
  ]

  context = module.this.context
}