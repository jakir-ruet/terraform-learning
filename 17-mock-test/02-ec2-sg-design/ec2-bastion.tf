# https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  # Define required variables only
  name = var.environment
  #   instance_count = 5
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #   monitoring = true
  subnet_id              = module.sg_public_bastion[0]
  vpc_security_group_ids = [module.sg_public_bastion.security_group_id]
  tags                   = local.common_tags
}
