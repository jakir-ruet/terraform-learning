# Define Input variable as you required
# https://github.com/terraform-aws-modules/terraform-aws-vpc/blob/v5.12.0/variables.tf
# ---------------------------------------
# Define VPC name
variable "vpc_name" {
  description = "The VPC's description"
  type        = string
  default     = "my-vpc"
}

# Define VPC's CIDR block
variable "vpc_cidr_block" {
  description = "The VPC's CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

# Define availability zones
variable "vpc_availability_zones" {
  description = "The VPC's availability zones"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
}

# Define public subnets
variable "vpc_public_subnets" {
  description = "The VPC's public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Define private subnets
variable "vpc_private_subnets" {
  description = "The VPC's private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Define database subnets
variable "vpc_database_subnets" {
  description = "The VPC's database subnets"
  type        = list(string)
  default     = ["10.0.6.0/24", "10.0.7.0/24"]
}

# Define database subnet group (t/f)
variable "vpc_database_subnet_group" {
  description = "The VPC's database subnet group"
  type        = bool
  default     = true
}

# Define database subnet route table (t/f)
variable "vpc_database_subnet_route_table" {
  description = "The VPC's database subnet route table"
  type        = bool
  default     = true
}

# Define & enable NAT gateway (t/f)
variable "vpc_enable_nat_gateway" {
  description = "The VPC's enable NAT Gateway"
  type        = bool
  default     = true
}

# Define single NAT gateway (t/f)
variable "vpc_single_nat_gateway" {
  description = "The VPC's single NAT gateway"
  type        = bool
  default     = true
}
