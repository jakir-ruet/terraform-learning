# VPC variables
vpc_name       = "my-vpc"
vpc_cidr_block = "10.0.0.0/16"

vpc_availability_zones = ["us-east-2a", "us-east-2b"]
vpc_public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
vpc_database_subnets   = ["10.0.6.0/24", "10.0.6.0/24"]

vpc_database_subnet_group       = true
vpc_database_subnet_route_table = true

vpc_enable_nat_gateway = true
vpc_single_nat_gateway = true