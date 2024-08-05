# VPC Input Variables
# VPC Name
variable "vpc_name" {
  description = "development test vpc"
  type = string
  default = "vpc-test"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "This is CIDR Block"
  type = string
  default = "10.0.0.0/16"
}

# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = list(string)
  default = [ "us-east-2a", "us-east-2b" ]
}

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = [ "10.0.101.0/24", "10.0.102.0/24" ]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

# VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type = list(string)
  default = [ "10.0.151.0/24", "10.0.152.0/24" ]
}

# Database Subnet Group (True/False) for VPC
variable "vpc_create_database_subnet_group" {
  description = "Database Subnet Group VPC"
  type = bool
  default = true
}

# Database Subnet Route Table (True/False) for VPC
variable "vpc_create_database_subnet_route_table" {
   description = "route table describe your variable"
   type = bool
   default = true
}

# Enable NAT Gateway (True/False) for VPC
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateways for Private subnets"
  type = bool
  default = true
}

# Single NAT Gateway (True/False) VPC
variable "vpc_single_nat_gateway" {
  description = "Enable only for single NAT"
  type = bool
  default = true
}