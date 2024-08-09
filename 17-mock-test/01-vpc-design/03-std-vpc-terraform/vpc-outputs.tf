# VPC output values
# ------------------------------------------
# Define VPC's ID
output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The VPC's CIDR block"
  value       = module.vpc.vpc_cidr_block
}

# VPC public subnets
output "vpc_public_subnets" {
  description = "The VPC's public subnets"
  value       = module.vpc.public_subnets
}

# VPC private subnets
output "vpc_private_subnets" {
  description = "The VPC's private subnets"
  value       = module.vpc.private_subnets
}

# VPC NAT gacteway for public IP
output "vpc_nat_public_ips" {
  description = "A list of public IPs"
  value       = module.vpc.nat_public_ips
}

# VPC AZ's
output "azs" {
  description = "A list of availability zone"
  value       = module.vpc.azs
}
