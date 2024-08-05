# Public EC2 instance - Bastion Host

output "ec2_bastion_public_instance_ids" {
  description = "EC2 Instane ID"
  value = module.ec2_public.public_ip
}