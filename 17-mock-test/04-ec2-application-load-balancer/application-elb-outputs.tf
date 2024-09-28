output "id" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.alb.id
}

output "arn" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.alb.arn
}

output "arn_suffix" {
  description = "ARN suffix of our load balancer"
  value       = module.alb.arn_suffix
}

output "dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.alb.dns_name
}

output "zone_id" {
  description = "The zone_id of the load balancer to assist DNS records"
  value       = module.alb.zone_id
}
