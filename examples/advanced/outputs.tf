output "zone_id" {
  description = "The ID of the Private Zone."
  value       = module.private_zone.zone_id
}

output "zone_name" {
  description = "The domain name of the Private Zone."
  value       = module.private_zone.zone_name
}

output "vpc_attachment_id" {
  description = "The ID of the VPC attachment."
  value       = module.private_zone.vpc_attachment_id
}

output "dns_record_ids" {
  description = "A map of DNS record IDs."
  value       = module.private_zone.dns_record_ids
}
