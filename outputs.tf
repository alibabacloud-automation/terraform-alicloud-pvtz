output "zone_id" {
  description = "The ID of the Private Zone."
  value       = local.zone_id
}

output "zone_name" {
  description = "The domain name of the Private Zone."
  value       = var.domain_name
}

output "vpc_attachment_id" {
  description = "The ID of the VPC attachment."
  value       = try(alicloud_pvtz_zone_attachment.this[0].id, null)
}

output "dns_record_ids" {
  description = "A map of DNS record IDs keyed by the record identifier."
  value       = { for k, v in alicloud_pvtz_zone_record.this : k => v.id }
}
