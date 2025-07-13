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
      name    = "cf2024-1._domainkey"
      ttl     = 1
      type    = "TXT"
      content = "\"v=DKIM1; h=sha256; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiweykoi+o48IOGuP7GR3X0MOExCUDY/BCRHoWBnh3rChl7WhdyCxW3jgq1daEjPPqoi7sJvdg5hEQVsgVRQP4DcnQDVjGMbASQtrY4WmB1VebF+RPJB2ECPsEDTpeiI5ZyUAwJaVX7r6bznU67g7LvFq35yIo4sdlmtZGV+i0H4cpYH9+3JJ78k\" \"m4KXwaf9xUJCWF6nxeD+qG6Fyruw1Qlbds2r85U9dkNDVAS3gioCvELryh1TxKGiVTkg4wqHTyHfWsp7KD3WQHYJn0RyfJJu6YEmL77zonn7p2SRMvTMP3ZEXibnC9gz3nnhR6wcYL8Q7zXypKTMD58bTixDSJwIDAQAB\""
    },
    {
      name    = "google._domainkey"
      ttl     = 1
      type    = "TXT"
      content = "\"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqjRJUcw2rtPhxDiYwXAdy4DstiUDecbkEe7OVLeG2Vu6BY19UhlFyqB8kXaZ61dGpPCfrSzJMGj0C/ciistM3SVOixbKtiOoywDbD1X3wmLS287QbeagICQsuRdWHgwF15ABUbfts/MbeLkH73IUDO/cTCJg8GrhtRvwyVpKgrKNN3nqhm3Yrrr5+/U/X+hb/\" \"nQHBhaURom4HSxdKipBxXV7G7K3yQ8ZIC8tYh+rlbvXOYAEnfstvTxg84K36oE9GC1tCmuGPJ8+trVrsJsnAhyX/v1it35m/wTG4G+wKmc2Yq5Z24x1W3AoudhRc1y0ozKkyrP/Ifrks87qbnlN2QIDAQAB\""
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
