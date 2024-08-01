provider "aws" {
  region = "us-east-2"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-0862be96e41dcbf74" # replace this
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-0639123841b6deb5a" # replace this
}