module "bryandady-com" {
  source = "./modules/zone"

  account_id = local.account_id
  zone_name  = "bryandady.com"

  records = [
    {
      name    = "@"
      ttl     = 1
      type    = "TXT"
      content = "\"v=spf1 include:_spf.mx.cloudflare.net include:_spf.google.com -all\""
    },
    {
      name    = "@"
      ttl     = 300
      type    = "TXT"
      content = "\"google-site-verification=Lw-rZr-6xaBGMdlTSRS3er4jdc3y5DQ2okEJdyegMVo\""
    },
    {
      name    = "_dmarc"
      ttl     = 1
      type    = "TXT"
      content = "\"v=DMARC1;p=quarantine;fo=1; rua=mailto:b4c69931e4884b64ba6cc0b178774023@dmarc-reports.cloudflare.net;\""
    },
    {
      name     = "@"
      type     = "MX"
      content  = "aspmx.l.google.com"
      priority = 1
    },
    {
      name     = "@"
      type     = "MX"
      content  = "alt1.aspmx.l.google.com"
      priority = 5
    },
    {
      name     = "@"
      type     = "MX"
      content  = "alt2.aspmx.l.google.com"
      priority = 5
    },
    {
      name     = "@"
      type     = "MX"
      content  = "alt3.aspmx.l.google.com"
      priority = 10
    },
    {
      name     = "@"
      type     = "MX"
      content  = "alt4.aspmx.l.google.com"
      priority = 10
    },
    {
      name    = "@"
      content = "bryandady-com.pages.dev"
      proxied = true
      type    = "CNAME"
    },
    {
      name    = "www"
      content = "bryandady-com.pages.dev"
      proxied = true
      type    = "CNAME"
    }
  ]
}
