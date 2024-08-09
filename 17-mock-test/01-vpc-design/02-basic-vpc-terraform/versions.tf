# https://developer.hashicorp.com/terraform/tutorials/configuration-language/versions
# Terraform (Setting) Block
terraform {
  required_version = "~> 1.9.3" # Terraform Version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.61.0" # AWS Provider Version
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}
