provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "my-terraform-instance" {
  instance_type = "t2.micro"
  ami = "ami-0862be96e41dcbf74"
  subnet_id = "subnet-0639123841b6deb5a"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "my-sweet-bucket"
}

# Making lock for version control
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}