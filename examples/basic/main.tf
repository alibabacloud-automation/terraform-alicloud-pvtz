data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

module "private_zone" {
  source = "../.."

  domain_name = "basic-example.internal"

  vpc_ids = [
    {
      vpc_id = data.alicloud_vpcs.default.ids[0]
    }
  ]

  dns_records = {
    web = {
      type  = "A"
      name  = "web"
      value = "10.0.1.10"
    }
  }
}
