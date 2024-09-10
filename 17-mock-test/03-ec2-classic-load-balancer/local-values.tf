# https://developer.hashicorp.com/terraform/language/values/locals
locals {
  owners = var.developer
  envs   = var.environment
  name   = "${var.developer}-${var.environment}" # Or
  # name = "${local.owners}-${local.envs}"

  common_tags = {
    # Owners = "${local.owners}"
    # Env = "${local.envs}"
    # Or
    Owners = local.owners
    Env    = local.envs
  }
}
