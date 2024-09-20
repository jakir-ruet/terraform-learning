module "sg_public_bastion" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.2.0"
  name        = "sg_public_bastion"
  description = "sg for bastion host - public"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]

  tags = {
    name = "sg-public-bastion"
  }
}

