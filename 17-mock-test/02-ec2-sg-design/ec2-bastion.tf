# https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name = var.environment

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair

  subnet_id              = module.vpc.public_subnets[0] # Reference the first public subnet
  vpc_security_group_ids = [module.sg_public_bastion.security_group_id]
  tags                   = local.common_tags
}
