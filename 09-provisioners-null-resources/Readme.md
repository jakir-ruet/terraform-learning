**Null Resource:** The `null_resource` is a resource type provided by the null provider. It's a special type of resource that doesn't actually create any infrastructure like as AWS, GCP & Azure.


**Provisioners** in Terraform are used to execute scripts or commands on a local or remote machine as part of the resource creation or destruction process. They can be used to bootstrap resources, configure servers, or run any other kind of initialization.

Create public & private key
```bash
ssh-keygen -t rsa
```
**Pre-Requisite**
- Virtual Private Cloud (VPC)
- Public Subnet
- Route Table (Internet Gateway)
- EC2 Instance
- Security Group (SG)
- IP & Port

Lets Perform
```bash
terraform init
terraform plan
terraform destroy # if already exist
terraform apply
```

Login to EC2 Instance from Terminal
```bash
ssh -i ~/.ssh/id_rsa ubuntu@EC2_Instant_Public_IP
```

