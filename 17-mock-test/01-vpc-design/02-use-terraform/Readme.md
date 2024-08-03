#### Design three tier application using Terraform

#### Step-01
- Create `vpc-module` named directory
  - Create a `version.tf` file in `vpc-module` directory
  - Create a `variable.tf` file in `vpc-module` directory
  - Create a `vpc.tf` file in `vpc-module` directory
    - Name: `vpc-test-dev`
    - CIDR: `10.0.0.0/16`

#### Step-02
- Create Terraform Registry account

#### Step-03
- Write codes as per our requirement on (`version.tf`, `variable.tf` & `vpc.tf`) apply these commands.
  - `terraform init`
  - Go to 'cd 17-mock-test/3-tier-architecture/02-use-terraform/vpc-module/.terraform/modules/'
  - `cat modules.json` 
  - Then go to `cd vpc-test` see entire module information
  - Go back `vpc-module` directory
  - `terraform validate` If everything is then we will get success
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
  - `terraform destroy -auto-approve`
  - `rm -rf .terraform*`
  - `rm -rf terraform.tfstate*`

