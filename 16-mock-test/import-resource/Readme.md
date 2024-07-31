How to import entire resources from AWS such as EC2 Instance.
`Answer`
Import the EC2 Instance
```bash
terraform init
terraform plan -generate-config-out=generated_resources.tf
```

Making `terraform.tfstate` EC2 Instance, So delete the `generated_resources.tf` from here, and execute as follows command.
```bash
terraform plan
terraform import aws_instance.my-vault i-0036bfdc40b8f4353
terraform plan # No changes
```