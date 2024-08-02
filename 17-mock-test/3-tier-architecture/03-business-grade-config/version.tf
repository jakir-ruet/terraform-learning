# Terraform (Setting) Block
terraform {
  required_version = "~> 1.9.3" # Terraform CLI Version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # AWS Provider Version
    }
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
  profile = "default"
}