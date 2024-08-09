# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.0"

  # Basic details of VPC
  name            = "my-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-2a", "us-east-2b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  # Database subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.6.0/24", "10.0.7.0/24"]

  # NAT & IG route
  create_database_nat_gateway_route      = false
  create_database_internet_gateway_route = false

  # NAT Gateway for outbout communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # tags call here
  tags = local.vpc_tags
}
