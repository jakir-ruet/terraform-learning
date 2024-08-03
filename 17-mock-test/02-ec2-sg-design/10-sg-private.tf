module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  name = "private-sg"
  description = "private-sg 80 & 22 port for entire VPC block"
  vpc_id = module.vpc-test.vpc_id

  # Ingress rules & CIDR Block
   ingress_rules = ["https-tcp", "http-80-tcp"]
   ingress_cidr_blocks = [module.vpc-test.vpc_cidr_block]

  # Egress rules & CIDR Block
  egress_rules = [all-all]

  # tags
  tags = local.common_tags
}