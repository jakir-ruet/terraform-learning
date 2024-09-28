module "sg_elb" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.2.0"
  name        = "sg_elb"
  description = "sg for classic-elb"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]

  tags = {
    name = "sg_elb"
  }
}
