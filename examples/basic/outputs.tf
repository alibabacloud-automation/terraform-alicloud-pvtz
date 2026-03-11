output "zone_id" {
  description = "The ID of the Private Zone."
  value       = module.private_zone.zone_id
}

output "zone_name" {
  description = "The domain name of the Private Zone."
  value       = module.private_zone.zone_name
}
