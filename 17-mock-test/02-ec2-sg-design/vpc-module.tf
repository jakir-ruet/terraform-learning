# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest?tab=inputs
# VPC Module Create
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.0"

  # VPC's basic details
  name                 = "${local.name}-${var.vpc_name}"
  cidr                 = var.vpc_cidr_block
  azs                  = var.vpc_availability_zones
  public_subnets       = var.vpc_public_subnets
  private_subnet_names = var.vpc_private_subnets

  # Database subnet
  database_subnets                       = var.vpc_database_subnets
  create_database_subnet_group           = var.vpc_database_subnet_group
  create_elasticache_subnet_route_table  = var.vpc_database_subnet_route_table
  create_database_internet_gateway_route = false
  create_database_nat_gateway_route      = false

  # NAT gateway for outbound communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Tags
  tags     = local.common_tags
  vpc_tags = local.common_tags

  # Additional tags
  public_subnet_tags = {
    Type = "Public Subnet Tag"
  }

  private_subnet_tags = {
    Type = "Private Subnet Tag"
  }

  database_subnet_tags = {
    Type = "Database Subnet Tag"
  }
}
