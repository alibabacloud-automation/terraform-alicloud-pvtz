data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

module "private_zone" {
  source = "../.."

  domain_name       = "advanced-example.internal"
  remark            = "Advanced-example-Private-Zone"
  resource_group_id = null

  vpc_ids = [
    {
      vpc_id    = data.alicloud_vpcs.default.ids[0]
      region_id = "cn-hangzhou"
    }
  ]

  dns_records = {
    web1 = {
      type  = "A"
      name  = "web1"
      value = "10.0.1.10"
      ttl   = 300
    }
    web2 = {
      type  = "A"
      name  = "web2"
      value = "10.0.1.11"
      ttl   = 300
    }
    www = {
      type  = "CNAME"
      name  = "www"
      value = "web1.advanced-example.internal"
      ttl   = 600
    }
    mail = {
      type     = "MX"
      name     = "mail"
      value    = "mail.advanced-example.internal"
      ttl      = 300
      priority = 10
    }
    spf = {
      type  = "TXT"
      name  = "_spf"
      value = "v=spf1 include:example.com ~all"
      ttl   = 300
    }
  }

  tags = {
    Environment = "production"
    Project     = "internal-dns"
    ManagedBy   = "Terraform"
  }
}
