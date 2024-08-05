module "ec2_private" {
  depends_on = [ module.vpc-test ]
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  name = "${var.env_development}-vm"
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
}