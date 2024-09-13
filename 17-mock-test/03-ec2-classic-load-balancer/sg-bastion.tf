# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
# Security group for Bastion host
module "sg_public_bastion" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "sg_public_bastion"
  description = "Security Group with SSH Port open for everybody, egress are all open worldwide"
  vpc_id      = module.vpc.vpc_id

  # Ingress rules & CIDR block
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # Egress rule all-all open
  egress_rules = ["all-all"]

  # Tags
  tags = local.common_tags
}
