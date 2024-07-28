provider "aws" {
    region = "us-east-2"
}

variable "ami" {
  description = "This is AMI for the instance"
}

variable "instance_type" {
  description = "This is the instance type, for my-ws-instance: t2.micro"
}

resource "aws_instance" "my-ws-instance" {
    ami = var.ami
    instance_type = var.instance_type
}