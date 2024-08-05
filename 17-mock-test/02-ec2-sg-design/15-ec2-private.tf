module "ec2_private" {
  depends_on = [ module.vpc-test ]
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  name = "${var.env_development}-vm"
}