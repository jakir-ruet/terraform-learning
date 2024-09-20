# https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/v5.1.2/examples/complete/outputs.tf

# public security group output
output "sg_public_bastion_group_id" {
  description = "The ID of the public bastion security group"
  value       = module.sg_public_bastion.security_group_id
}

output "sg_public_bastion_group_vpc_id" {
  description = "The public VPC ID"
  value       = module.sg_public_bastion.security_group_vpc_id
}

output "sg_public_bastion_group_name" {
  description = "The name of the public security group"
  value       = module.sg_public_bastion.security_group_name
}

# private security group output
output "sg_private_group_id" {
  description = "The ID of the private bastion security group"
  value       = module.sg_private.security_group_id
}

output "sg_private_group_vpc_id" {
  description = "The private VPC ID"
  value       = module.sg_private.security_group_vpc_id
}

output "sg_public_group_name" {
  description = "The name of the private security group"
  value       = module.sg_private.security_group_name
}

