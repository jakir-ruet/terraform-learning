# All are Input Variables
# AWS Region
variable "aws_region" {
  description = "Use region for VPC"
  type = string
  default = "us-east-2"
}

# Environment Variables
# Owner Variables
variable "owner" {
  description = "Owner of the application"
  type = string
  default = "admin"
}

variable "env_development" {
  description = "Stage environment"
  type = string
  default = "development"
}

variable "env_production" {
  description = "Production environment"
  type = string
  default = "production"  
}
