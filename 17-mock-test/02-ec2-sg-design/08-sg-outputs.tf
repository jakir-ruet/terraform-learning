# Public bastion host security group output
output "public_bastion_sg_group_id" {
  description = "The ID of the security group id"
  value       = module.public_bastion_sg.security_group_id
}

output "public_bastion_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_bastion_sg.security_group_vpc_id
}

output "public_bastion_sg_group_name" {
  description = "The name of the security group name"
  value       = module.public_bastion_sg.security_group_name
}

# Private bastion host security group output
output "private_sg_group_id" {
  description = "The ID of the security group id"
  value       = module.private_sg.security_group_id
}

output "private_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_sg.security_group_name
}

output "private_sg_group_name" {
  description = "The name of the security group name"
  value       = module.private_sg.security_group_name
}