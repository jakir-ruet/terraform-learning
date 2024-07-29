provider "aws" {
  region = "us-east-2"
}

provider "vault" {
  address = "18.221.82.255:80"
  skip_child_token = true
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id = "743f0h42-8d64-nf5e-9834-j0fgmbvsmv"
      secret_id = "gf3f042-8fgd4-jgte-7843-h843dhsdr"
    }
  }
}

data "vault_kv_secret_v2" "my-data-kv" {
  mount = "secret"
  name = "test-secret"
}