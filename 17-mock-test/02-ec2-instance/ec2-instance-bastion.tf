module "ec2_bastion_instance" {
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "5.7.0"
  name          = "${var.environment}-public_bastion_host"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.sg_public_bastion.security_group_id]
  tags = {
    name = "public-bastion-instance"
  }
}
