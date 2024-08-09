### Welcome to Business Grade or Standard VPC Design Project
#### Step-01
- Work in `version.tf`
- Work in `variables.tf`
- Work in `local-values.tf`
- Work in `terraform.tfvars`
- Work in `vpc-variables.tf`
- Work in `vpc-module.tf`
- Work in `vpc-outputs.tf`
- Work in `vpc-auto.tfvars`

#### Step-02
- `terraform init`
- `terraform validate`
- `terraform plan`
- `terraform apply -auto-approve`
- Observation the Process
  - Verify VPC
  - Verify Subnets
  - Verify Internet Gateway
  - Verify Public Route for public Subnets
  - Verify no public route for private subnets
  - Verify NAT Gateway & Elastic IP for NAT Gateway
  - Verify NAT Gateway route for private subnets
  - Verify no public route or no NAT Gateway route to Database Gateway
  - Verify Tags
#### Step-03
- `terraform destroy -auto-approve`
- `rm -rf .terraform*`
- `rm -rf terraform.tfstate*`

### Upgrade
- Put the expected version on `Terraform (Setting) Block` & `Provider Block` in `versions.tf` file.
- Execute the necessary commands & then observe the result.

👍 👍 👍 Done! 👍 👍 👍 