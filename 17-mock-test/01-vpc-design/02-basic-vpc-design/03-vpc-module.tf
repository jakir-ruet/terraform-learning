module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  name = "my_first_tf_vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  # Database subnets
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  database_subnets                       = ["10.0.6.0/24", "10.0.7.0/24"]
  create_database_nat_gateway_route      = false
  create_database_internet_gateway_route = false

  # NAT Gateway
  enable_nat_gateway = true
  single_nat_gateway = true

  # Assign DNS Parameter
  enable_dns_hostnames = false

  public_subnet_tags = {
    Type = "public subnet"
  }
  private_subnet_tags = {
    Type = "private subnet"
  }
  database_subnet_tags = {
    Type = "database subnet"
  }
  tags = {
    owner = "jakir"
    env   = "dev"
  }
  vpc_tags = {
    name = "my_first_tf_vpc"
  }
}
