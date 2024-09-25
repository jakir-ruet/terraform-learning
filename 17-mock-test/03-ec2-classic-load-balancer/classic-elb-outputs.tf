output "elb_id" {
  description = "this elb id"
  value       = module.classic_elb.elb_id
}

output "elb_name" {
  description = "this is elb name"
  value       = module.classic_elb.elb_name
}

output "elb_dns_name" {
  description = "this is elb dns name"
  value       = module.classic_elb.elb_dns_name
}

output "elb_instances" {
  description = "this elb instance"
  value       = module.classic_elb.elb_instances
}

output "elb_source_security_group_id" {
  description = "this elb source security group id"
  value       = module.classic_elb.elb_source_security_group_id
}
