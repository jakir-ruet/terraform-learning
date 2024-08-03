# Create a [Module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest) 
module "vpc-test" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  # [VPC Basic Details](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
  # Collect variable from inputs tab
  name = "vpc-test-dev"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]

  # Private & Public Subnets
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  # Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]

  create_database_nat_gateway_route = false
  create_database_internet_gateway_route = false

  # NAT gateways for outbound communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

   # Tagging
   tags = {
      Owner = "Jakir"
      Environment = "dev"
   }

   vpc_tags = {
      Name = "vpc-dev"
   }

   public_subnet_tags = {
      Type = "public-subnets"
   }

   private_subnet_tags = {
      Type = "private-subnets"
   }

   database_subnet_tags = {
      Type = "database-subnets"
   }
}