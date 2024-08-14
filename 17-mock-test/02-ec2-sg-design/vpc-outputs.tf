# VPC ID
output "vpc_id" {
  description = "This is VPC ID"
  value       = module.vpc.vpc_id
}

# VPC CIDR Blocks
output "vpc_cidr_block" {
  description = "This is CIDR Block"
  value       = module.vpc.vpc_cidr_block
}

# VPC Privates Subnets
output "private_subnets" {
  description = "This is private subnets"
  value       = module.vpc.private_subnets
}

# VPC Privates Subnets
output "public_subnets" {
  description = "This is public subnets"
  value       = module.vpc.public_subnets
}

# NAT Gateways for public IP
output "nat_public_ips" {
  description = "List of elastic IPs"
  value       = module.vpc.nat_public_ips
}

# VPC Availabilty Zones
output "azs" {
  description = "List of availability in specfic zone"
  value       = module.vpc.azs
}
