**In Terraform**, workspaces are a way to manage multiple instances of a single Terraform configuration. Each workspace maintains its own state file, which allows you to manage different environments (e.g., development, staging, production) without having to create separate configurations for each.

**Prerequisites**

- An HCP Terraform account and organization
- Terraform v1.1+ installed locally and configured with your HCP Terraform token
- An AWS account
- A GitHub account

```bash
terraform init
terraform plan 
terraform apply
terraform show # check resource
```
Add another tfvars named `stage.tfvars`
```bash
terraform apply -var-file=stage.tfvars # here modify the ec2 instance t2.micro to t2.medium.
```
However, we want to create a new ec2 instance using this module's approach. Let's go using workspaces for that.
