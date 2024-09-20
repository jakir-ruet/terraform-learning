# For Public Security Group
output "sg_public_bastion_group_id" {
  description = "the id of public bastion security group"
  value       = module.sg_public_bastion.security_group_id
}

output "sg_public_bastion_group_vpc_id" {
  description = "the vpc id of vpc"
  value       = module.sg_public_bastion.security_group_vpc_id
}

output "sg_public_bastion_group_name" {
  description = "the public bastion group name"
  value       = module.sg_public_bastion.security_group_name
}

# For Private Security Group
output "sg_private_group_id" {
  description = "the id of private security group"
  value       = module.sg_private.security_group_id
}

output "sg_private_group_vpc_id" {
  description = "the vpc id of vpc - private"
  value       = module.sg_private.security_group_vpc_id
}

output "sg_private_group_name" {
  description = "the private security group name"
  value       = module.sg_private.security_group_name
}
