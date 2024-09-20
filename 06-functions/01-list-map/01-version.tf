# https://registry.terraform.io/browse/providers?tier=official
# Terraform Block
terraform {
  required_version = ">= 1.9.5" # https://developer.hashicorp.com/terraform/install
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
