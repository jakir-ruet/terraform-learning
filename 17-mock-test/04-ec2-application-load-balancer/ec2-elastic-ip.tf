resource "aws_eip" "ec2_bastion_eip" {
  depends_on = [module.ec2_bastion_instance, module.vpc]
  instance   = module.ec2_bastion_instance.id
  domain     = "vpc"

  tags = {
    "name" = "eip bastion"
  }
}
