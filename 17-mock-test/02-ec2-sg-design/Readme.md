#### Design EC2 Instance & Security Group
##### Sept-01: Pre-Requisite
- Create Private Key in `private-key.pem` file
```bash
openssl genpkey -algorithm RSA -out private-key.pem -aes256
openssl genpkey -algorithm RSA -out private-key.pem
openssl genpkey -algorithm RSA -out private-key.pem -aes256 -pkeyopt rsa_keygen_bits:2048 # size declare [Optional]
```
- Create `local-exec-output-files` named directory where `local-exec` provisioner creates a file (creation-time provisioner)

##### Step-02: VPC Configuration in previous section (01-vpc-design)

##### Step-03: Create manifest files in `02-ec2-sg-design` directory as below
- 01-version.tf
- 02-variables.tf
- 03-local-values.tf
- 04-vpc-variables.tf
- 05-vpc-module.tf
- 06-vpc-outputs.tf
- 07-sg-variables.tf
- 08-sg-bastion.tf
- 09-sg-outputs.tf
- 10-sg-private.tf
- 11-ami-datasource.tf
- 12-ec2-variables.tf
- 13-ec2-bastion.tf
- 14-ec2-outputs.tf
- 15-ec2-private.tf
- 16-elastic-ip.tf
- 17-null-resource-provisioners.tf
- 18-ec2.auto.tfvars
- 19-terraform.tfvars
- 20-vpc.auto.tfvars

##### Step-04: Install Apache & Configure in `app-one.sh` file.

##### Step-05: Create SG for Bastion Host & Private Subnet Hosts
- [Security Group](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest)

##### Step-06: Create `11-ami-datasource.tf`

##### Step-07: Create `12-ec2-variables.tf`

