locals {
  owner     = "Jakir"
  org       = "LapisSoft"
  authority = var.system_admin # Assuming var.system_admin is a valid variable
  env       = var.environment  # Assuming var.environment is a valid variable

  common_tags = {
    app_owner = local.owner
    org_name  = local.org
  }
}
