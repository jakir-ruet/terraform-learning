provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "my-ec2-instance" {
    ami = var.ami_value
    instance_type = var.instance_type_value
    subnet_id = var.subnet_id_value
}