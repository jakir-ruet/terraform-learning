# AWS EC2 Instance terraform module
# Bastion Host
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws//examples/complete"
  version = "5.6.1"
  name = "${var.env_development}-Bastion Host"
  #instance_type = 5
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  #monitoring = true
  subnet_id = module.vpc-test.public_subnets[0]
  #vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  tags = local.common_tags
}