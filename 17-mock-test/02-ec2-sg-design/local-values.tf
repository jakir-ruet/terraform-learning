# define local values
locals {
  owners = var.owner
  env_dev = var.env_development
  env_prod = var.env_production
  # we can define it as name
  #name = "${var.owner}-${var.env_development}-${var.env_production}"
  #name = "${local.owner}-${local.env_development}-${local.env_production}"
  common_tags = {
   owners = local.owners
   env_dev = local.env_dev
   env_prod = local.env_prod
  }
}