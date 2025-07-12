module "bryandady-com" {
  source = "./modules/zone"

  account_id = local.account_id
  zone_name  = "bryandady.com"

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
}
