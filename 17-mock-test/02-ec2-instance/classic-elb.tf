module "classic_elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.2"
  name = "${var.environment}-classic-elb"
  subnets         = [
   module.vpc.public_subnets[0],
   module.vpc.public_subnets[1]
  ]
  security_groups = [module.sg_classic-elb.security_group_vpc_id]
#   internal        = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "http"
      lb_port           = "80"
      lb_protocol       = "http"
    },
    {
      instance_port     = "80"
      instance_protocol = "http"
      lb_port           = "80"
      lb_protocol       = "http"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  # ELB attachments
  number_of_instances = var.private_instance_count
  instances           = [
   module.ec2_private_instance[0],
   module.ec2_private_instance[1]
  ]
  tags = local.common_tags
}