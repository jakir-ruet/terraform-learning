resource "aws_eip" "ec2_bastion_eip" {
  depends_on = [module.ec2_public, module.vpc]
  instance   = module.ec2_public.id[0]
  domain     = "vpc"
  tags       = local.common_tags
}
