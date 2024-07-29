terraform {
  backend "s3" {
    bucket = "my-sweet-bucket"
    region = "us-east-2"
    key = "jakir-ruet/terraform.tfstate"
    encrypt = true
    dynamodb_table = "terraform-lock"
  }
}