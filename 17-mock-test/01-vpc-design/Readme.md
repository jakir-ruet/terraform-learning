#### Design the business grade 3-tier application

#### Road Map
1. Create VPC
2. Create Private and Public Subnets
   - Create Public Subnets
   - Create Private Subnets
3. Create Internet Gateway (IGW) & associate to VPC
4. Create NAT Gateway
5. Create Public Route Table (RT) & Integrate through Internet Gateway (IGW) and associate public subnets
   - Create Route Table (RT)
   - Create public route in newly created route table
   - Associate public subnet-1 in Route Table
6. Create Private Route Table (RT) & Integrate through NAT Gateway (NGW) and associate private subnets
   - Create Private Route Table (RT)
   - Create private route in newly created route table
   - Associate private subnet-1 in Route Table

##### 🚴 Let's get started.

#### Execute this Commands
```bash
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

**Observation the Process**
- Verify VPC
  - Verify Subnets
  - Verify Internet Gateway
  - Verify Public Route for public Subnets
  - Verify no public route for private subnets
  - Verify NAT Gateway & Elastic IP for NAT Gateway
  - Verify NAT Gateway route for private subnets
  - Verify no public route or no NAT Gateway route to Database Gateway
  - Verify Tags

```bash
terraform destroy -auto-approve
rm -rf .terraform*
rm -rf terraform.tfstate*
```

#### Version Constraints in Terraform with Modules
- [Terraform Version Constraints](https://www.terraform.io/docs/language/expressions/version-constraints.html)
- For modules locking to the exact version is **recommended** to ensure there will not be any major breakages in production
- When depending on third-party modules, **require specific versions** to ensure that updates only happen when convenient to you
- For modules maintained within your organization, specifying version ranges may be appropriate if semantic versioning is used consistently or if there is a well-defined release process that avoids unwanted updates.
- [Review and understand this carefully](https://www.terraform.io/docs/language/expressions/version-constraints.html#terraform-core-and-provider-versions)