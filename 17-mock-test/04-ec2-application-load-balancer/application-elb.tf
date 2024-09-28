module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.11.0"
  # four required variables
  name               = "${local.env}-my-alb"
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]
  security_groups = [module.sg_elb.security_group_id]

  # Listeners
  security_group_ingress_rules = {
    all_http = {
      from_port          = 80
      to_port            = 80
      ip_protocol        = "tcp"
      description        = "HTTP web traffic"
      cidr_ipv4          = "0.0.0.0/0"
      target_group_index = 0
    }
  }
  # Target Groups
  target_groups = {
    # app1 targer group > target group
    ex-instance = {
      name_prefix                       = "app1"
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_algorithm_type     = "weighted_random"
      load_balancing_anomaly_mitigation = "on"
      load_balancing_cross_zone_enabled = false

      target_group_health = {
        dns_failover = {
          minimum_healthy_targets_count = 2
        }
        unhealthy_state_routing = {
          minimum_healthy_targets_percentage = 50
        }
      }

      health_check = {
        enabled             = true
        interval            = 30
        path                = "/myapp/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      # app1 target group > target regiaters
      protocol_version = "HTTP1"
      targets = {
        alb-instance1 = {
          target_id = [for instance in module.vpc.ec2_private : instance.id][0]
          port      = 80
        },
        alb-instance2 = {
          target_id = [for instance in module.vpc.ec2_private : instance.id][1]
          port      = 80
        }
      }
      tags = local.common_tags
    }
  }
  tags = local.common_tags
  # App1 Target Group
}
