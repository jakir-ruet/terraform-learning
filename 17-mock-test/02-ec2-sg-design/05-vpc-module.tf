module "vpc-test" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  # Basic details of VPC
  name = "${var.owner}-${var.env_development}-${var.env_production}"
  cidr = var.vpc_cidr_block
  azs = var.vpc_availability_zones
  public_subnets = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  # Database Subnets
  database_subnets = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  create_database_internet_gateway_route = false
  create_database_nat_gateway_route = false

  # NAT gateway for outbound communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

   # VPC DNS Parameters
   enable_dns_hostnames = true
   enable_dns_support = true

   tags = local.common_tags
   vpc_tags = local.common_tags

   # extra tag for subnets
   public_subnet_tags = {
      Type = "Public Subnets"
   }

   private_subnet_tags = {
      Type = "Private Subnets"
   }

   database_subnet_tags = {
      Type = "Private Database Subnets"
   }
}