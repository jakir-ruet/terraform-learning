# EC2 Instnce will be created in VPC subnets
module "ec2_private" {
  # It's essential, or else userdata web server provisioning will fail
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "5.6.1"

  name                   = "${var.environment}-vm"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [module.sg_public_bastion.security_group_id]
  subnet_id              = module.vpc.private_subnets[2]
  count                  = var.private_instance_count
  user_data              = file("${path.module}/app-one.sh")
  tags                   = local.common_tags
}
