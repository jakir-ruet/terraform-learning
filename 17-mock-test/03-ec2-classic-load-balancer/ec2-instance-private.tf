module "ec2_private_instance" {
  depends_on    = [module.vpc]
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "5.7.0"
  name          = "${var.environment}-private_instance"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #   monitoring    = true
  vpc_security_group_ids = [module.sg_private.security_group_id]
  subnet_id              = module.vpc.private_subnets[count.index % length(module.vpc.private_subnets)]
  count                  = var.private_instance_count
  user_data              = file("${path.module}/app-one.sh")

  tags = {
    name = "private-subnets"
  }
}
