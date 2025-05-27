module "bryandady-com" {
  source  = "cloudposse/zone/cloudflare"
  version = "~> 1.0"

  account_id = local.account_id
  zone       = "bryandady.com"

  records = [
    {
      name    = "@"
      ttl     = 300
      type    = "TXT"
      content = "v=spf1 -all"
    },
    {
      name    = "_dmarc"
      ttl     = 300
      type    = "TXT"
      content = local.dmarc_quarantine
    },
    {
      name    = "@"
      content = "bcdady-github-io.pages.dev"
      proxied = true
      type    = "CNAME"
    },
    {
      name    = "www"
      content = "bcdady-github-io.pages.dev"
      proxied = true
      type    = "CNAME"
    }
  ]

  context = module.this.context
}
