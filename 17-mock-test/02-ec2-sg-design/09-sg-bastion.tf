module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  name = "public-bastion-sg"
  description = "public-bastion-sg 22 port for all"
  vpc_id = module.vpc-test.vpc_id

  # Ingress rules & CIDR Block
   ingress_rules = ["https-tcp"]
   ingress_cidr_blocks = ["0.0.0.0/0"]

  # Egress rules & CIDR Block
  egress_rules = [all-all]

  # tags
  tags = local.common_tags
}