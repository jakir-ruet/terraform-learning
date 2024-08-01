data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # collect it from AMI menu

   filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-server-20240701.1"]
   }

   filter {
   name = "root_device_type"
   values = ["ebs"]
   }

   filter {
     name = "architecture"
     values = ["x86_64"]
   }

   filter {
      name   = "virtualization-type"
      values = ["hvm"]
   }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "kp-my-datasource" # Replace with your key pair name

  tags = {
    Name = "tg-datasource"
  }
}