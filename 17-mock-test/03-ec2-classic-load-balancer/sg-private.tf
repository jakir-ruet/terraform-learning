
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
# Security group for Bastion host
module "sg_private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "sg_private"
  description = "Security Group with SSH & HTTP Port open for entire VPC block, egress are all open worldwide"
  vpc_id      = module.vpc.vpc_id

  # Ingress rules & CIDR block
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  # Egress rule all-all open
  egress_rules = ["all-all"]

  # Tags
  tags = local.common_tags
}
