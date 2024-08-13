# AWS EC2 Instance outputs

# Fro public EC2 Instances

# EC2 bastion public instance ids
output "ec2_public_ids" {
  description = "List of public ids"
  value       = module.ec2_public.id
}
# EC2 bastion public ip
output "ec2_public_ids" {
  description = "List of public instance ids"
  value       = module.ec2_public.public_ip
}


# Fro private EC2 Instances

# EC2 bastion private instance ids
output "ec2_private_ids" {
  description = "List of private instance ids"
  value       = module.ec2_private.id
}

# EC2 bastion private ip
output "ec2_private_ip" {
  description = "The private IP address"
  value       = module.ec2_private.private_ip
}
