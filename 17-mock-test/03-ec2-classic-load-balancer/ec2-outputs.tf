# AWS EC2 Instance outputs

# Fro public EC2 Instances
# EC2 bastion public instance ids
output "ec2_public_ids" {
  description = "List of public instance IDs"
  value       = [for instance in module.ec2_public : instance.id]
}

output "ec2_public_ip" {
  description = "List of public instance IPs"
  value       = [for instance in module.ec2_public : instance.public_ip]
}



# Fro private EC2 Instances
# EC2 bastion private instance ids
output "ec2_private_ids" {
  description = "List of private instance IDs"
  value       = [for instance in module.ec2_private : instance.id]
}

output "ec2_private_ip" {
  description = "List of private instance IPs"
  value       = [for instance in module.ec2_private : instance.private_ip]
}

