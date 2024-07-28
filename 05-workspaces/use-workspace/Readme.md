**In Terraform**, workspaces are a way to manage multiple instances of a single Terraform configuration. Each workspace maintains its own state file, which allows you to manage different environments (e.g., development, staging, production) without having to create separate configurations for each.

**Prerequisites**

- An HCP Terraform account and organization
- Terraform v1.1+ installed locally and configured with your HCP Terraform token
- An AWS account
- A GitHub account

```bash
terraform workspace new dev
terraform workspace new stage
terraform workspace new prod
```
Create EC2 Instance on dev state
```bash
terraform workspace select dev
terraform show
terraform init
terraform apply
```
Create EC2 Instance on stage state
```bash
terraform workspace select stage
terraform show
terraform init
terraform apply
```
Create EC2 Instance on prod state
```bash
terraform workspace select prod
terraform show
terraform init
terraform apply
```