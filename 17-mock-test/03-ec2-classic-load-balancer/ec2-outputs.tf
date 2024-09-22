
output "ec2_bastion_public" {
  description = "ec2 bastion public ID"
  value       = module.ec2_bastion_instance.id
}

output "ec2_bastion_ip" {
  description = "ec2 bastion public IP"
  value       = module.ec2_bastion_instance.public_ip
}

output "ec2_private" {
  description = "list of ec2 private instance ID"
  value       = [for ec2PrivateIds in module.ec2_private_instance : ec2PrivateIds.id]
}

output "ec2_private_ip" {
  description = "list of ec2 private instance IP"
  value       = [for ec2PrivateIps in module.ec2_private_instance : ec2PrivateIps.private_ip]
}
