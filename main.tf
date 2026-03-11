locals {
  zone_id = var.create_zone ? alicloud_pvtz_zone.this[0].id : var.existing_zone_id
}

resource "alicloud_pvtz_zone" "this" {
  count = var.create_zone ? 1 : 0

  zone_name         = var.domain_name
  remark            = var.remark
  resource_group_id = var.resource_group_id
  tags              = var.tags
}

resource "alicloud_pvtz_zone_attachment" "this" {
  count = length(var.vpc_ids) > 0 ? 1 : 0

  zone_id = local.zone_id

  dynamic "vpcs" {
    for_each = var.vpc_ids
    content {
      vpc_id    = vpcs.value.vpc_id
      region_id = vpcs.value.region_id
    }
  }
}

resource "alicloud_pvtz_zone_record" "this" {
  for_each = var.dns_records

  zone_id  = local.zone_id
  rr       = each.value.name
  type     = each.value.type
  value    = each.value.value
  ttl      = each.value.ttl
  priority = each.value.priority
  status   = each.value.status
}
