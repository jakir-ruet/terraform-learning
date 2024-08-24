### Welcome to Basic VPC Design Project
**Steps:**
- Select the Region 
- Create VPC 
- Enable DNS Host Name in the VPC 
- Create Internet Gateway 
- Attach Internet Gateway to VPC 
- Create Public Subnets 
- Enable Auto Assign Public IP Settings 
- Create Public Route Table 
- Add Public Route to the Public Route Table 
- Associate the Public Subnets with the Public Route Table 
- Create the Private Subnets 
- Create NAT Gateway in Public Subnet 
- Create an EIP and Associate it to the NAT Gateways 
- Create Private Route Table 
- Add Public Route to the Private Route Table 
- Associate the Private Subnets with the Private Route Table

Execution using this command
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
- `terraform destroy -auto-approve`
- `rm -rf .terraform*`
- `rm -rf terraform.tfstate*`
  
### Upgrade
- Put the expected version on `Terraform (Setting) Block` & `Provider Block` in `versions.tf` file.
- Execute the necessary commands & then observe the result.

👍 👍 👍 Done! 👍 👍 👍 