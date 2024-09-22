output "vpc_id" {
  description = "the vpc id"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "the cidr block for vpc"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "list of ids of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "list of private subnets"
  value       = module.vpc.private_subnets
}

output "nat_public_ips" {
  description = "list of elastic public ips for nat gateway"
  value       = module.vpc.nat_public_ips
}

output "azs" {
  description = "list of availability zone"
  value       = module.vpc.azs
}
