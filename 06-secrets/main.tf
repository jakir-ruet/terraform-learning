provider "aws" {
  region = "us-east-2"
}

provider "vault" {
  address = "<>:80"
  skip_child_token = true
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id = "<>"
      secret_id = "<>"
    }
  }
}

data "vault_kv_secret_v2" "my-data-kv" {
  mount = "secret"
  name = "test-secret"
}