### Design EC2 Instance & Security Group
#### Sept-01: Pre-Requisite
- Create Private Key in `private-key.pem` file
```bash
openssl genpkey -algorithm RSA -out private-key.pem -aes256
openssl genpkey -algorithm RSA -out private-key.pem
openssl genpkey -algorithm RSA -out private-key.pem -aes256 -pkeyopt rsa_keygen_bits:2048 # size declare [Optional]
```
- Create `local-exec-output-files` named directory where `local-exec` provisioner creates a file (creation-time provisioner)

##### Road Man
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

#### Step-02: Common Version, Variables & Local-Values
##### Version
```json
// # Terraform (Setting) Block
terraform {
  required_version = "~> 1.9.3" # Terraform CLI Version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # AWS Provider Version
    }
    # its use for 18-null-resource-provisioners.tf
    null = {
      source = "hashicorp/null"
      version = "~> 5.0"
    }
  }
}

// # Provider Block
provider "aws" {
  region = var.aws_region
  profile = "default"
}
```

##### Variables
```json
// <!-- # All are Input Variables
// # AWS Region -->
variable "aws_region" {
  description = "Use region for VPC"
  type = string
  default = "us-east-2"
}

// <!-- # Environment Variables
// # Owner Variables -->
```json
variable "owner" {
  description = "Owner of the application"
  type = string
  default = "admin"
}

variable "env_development" {
  description = "Stage environment"
  type = string
  default = "development"
}

variable "env_production" {
  description = "Production environment"
  type = string
  default = "production"  
}
```

##### Local Values
```json
// # define local values
locals {
  owners = var.owner
  env_dev = var.env_development
  env_prod = var.env_production
//   # we can define it as name
  name = "${var.owner}-${var.env_development}-${var.env_production}"
//   #name = "${local.owner}-${local.env_development}-${local.env_production}"
  common_tags = {
   owners = local.owners
   env_dev = local.env_dev
   env_prod = local.env_prod
  }
}
```

#### Step-02: Complete VPC Configuration
##### VPC Variables
```json
// # VPC Input Variables
// # VPC Name
variable "vpc_name" {
  description = "development test vpc"
  type = string
  default = "vpc-test"
}

// # VPC CIDR Block
variable "vpc_cidr_block" {
  description = "This is CIDR Block"
  type = string
  default = "10.0.0.0/16"
}

// # VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = list(string)
  default = [ "us-east-2a", "us-east-2b" ]
}

// # VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = [ "10.0.101.0/24", "10.0.102.0/24" ]
}

// # VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

// # VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type = list(string)
  default = [ "10.0.151.0/24", "10.0.152.0/24" ]
}

// # Database Subnet Group (True/False) for VPC
variable "vpc_create_database_subnet_group" {
  description = "Database Subnet Group VPC"
  type = bool
  default = true
}

// # Database Subnet Route Table (True/False) for VPC
variable "vpc_create_database_subnet_route_table" {
   description = "route table describe your variable"
   type = bool
   default = true
}

// # Enable NAT Gateway (True/False) for VPC
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateways for Private subnets"
  type = bool
  default = true
}

// # Single NAT Gateway (True/False) VPC
variable "vpc_single_nat_gateway" {
  description = "Enable only for single NAT"
  type = bool
  default = true
}
```

##### VPC Module
```json
module "vpc-test" {
   source  = "terraform-aws-modules/vpc/aws"
   version = "5.9.0"

   //   # Basic details of VPC
   name = "${var.owner}-${var.env_development}-${var.env_production}"
   cidr = var.vpc_cidr_block
   azs = var.vpc_availability_zones
   public_subnets = var.vpc_public_subnets
   private_subnets = var.vpc_private_subnets

   //   # Database Subnets
   database_subnets = var.vpc_database_subnets
   create_database_subnet_group = var.vpc_create_database_subnet_group
   create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
   create_database_internet_gateway_route = false
   create_database_nat_gateway_route = false

   //   # NAT gateway for outbound communication
   enable_nat_gateway = var.vpc_enable_nat_gateway
   single_nat_gateway = var.vpc_single_nat_gateway

   // # VPC DNS Parameters
   enable_dns_hostnames = true
   enable_dns_support = true

   tags = local.common_tags
   vpc_tags = local.common_tags

   // # extra tag for subnets
   public_subnet_tags = {
      Type = "Public Subnets"
   }

   private_subnet_tags = {
      Type = "Private Subnets"
   }

   database_subnet_tags = {
      Type = "Private Database Subnets"
   }
}
```

##### VPC Outputs
```json
// # VPC ID
output "vpc_id" {
  description = "This is VPC ID"
  value = module.vpc-test.vpc_id
}

// # VPC CIDR Blocks
output "vpc_cidr_block" {
  description = "This is CIDR Block"
  value = module.vpc-test.vpc_cidr_block
}

// # VPC Privates Subnets
output "private_subnets" {
  description = "This is private subnets"
  value = module.vpc-test.private_subnets
}

// # VPC Privates Subnets
output "public_subnets" {
  description = "This is public subnets"
  value = module.vpc-test.public_subnets
}

// # NAT Gateways for public IP
output "nat_public_ips" {
   description = "List of elastic IPs"
   value = module.vpc-test.nat_public_ips
}

// # VPC Availability Zones
output "azs" {
  description = "List of availability in specfic zone"
  value = module.vpc-test.azs
}
```

#### Step-04: Add `app-one.sh` named file in directory
```bash
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo echo '<h1>Welcome to my application</h1>' | sudo tee /var/www/html/index.html
sudo mkdir -p /var/www/html/myapp
sudo echo '<!DOCTYPE html>
<html>
<head>
    <title>Welcome to my application</title>
</head>
<body style="background-color: white;">
    <h1>Welcome to my application</h1>
    <p>This is a simple demo application use for testing purpose</p>
    <p>Application version: V1.0</p>
</body>
</html>' | sudo tee /var/www/html/myapp/index.html

# Retrieve instance metadata if running on AWS EC2
if [ -f /sys/hypervisor/uuid ] && grep -q ec2 /sys/hypervisor/uuid; then
    TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
    sudo curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/myapp/metadata.html
fi
```

#### Step-05: Complete Security Group Configuration
##### Variable ()
##### Outputs
```json
// # Public bastion host security group output
output "public_bastion_sg_group_id" {
  description = "The ID of the security group id"
  value       = module.public_bastion_sg.security_group_id
}

output "public_bastion_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_bastion_sg.security_group_vpc_id
}

output "public_bastion_sg_group_name" {
  description = "The name of the security group name"
  value       = module.public_bastion_sg.security_group_name
}

// # Private bastion host security group output
output "private_sg_group_id" {
  description = "The ID of the security group id"
  value       = module.private_sg.security_group_id
}

output "private_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_sg.security_group_name
}

output "private_sg_group_name" {
  description = "The name of the security group name"
  value       = module.private_sg.security_group_name
}
```
##### bastion
```json
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  name = "public-bastion-sg"
  description = "public-bastion-sg 22 port for all"
  vpc_id = module.vpc-test.vpc_id

//   # Ingress rules & CIDR Blockå
   ingress_rules = ["https-tcp"]
   ingress_cidr_blocks = ["0.0.0.0/0"]

//   # Egress rules & CIDR Blockå
  egress_rules = [all-all]

//   # tagså
  tags = local.common_tags
}
```
##### private
```json
module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  name = "private-sg"
  description = "private-sg 80 & 22 port for entire VPC block"
  vpc_id = module.vpc-test.vpc_id

//   # Ingress rules & CIDR Blockß
   ingress_rules = ["https-tcp", "http-80-tcp"]
   ingress_cidr_blocks = [module.vpc-test.vpc_cidr_block]

//   # Egress rules & CIDR Blockß
  egress_rules = [all-all]

//   # tagsß
  tags = local.common_tags
}
```

#### Step-06: AMI Datasource
```json
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"] # Canonical's AWS account ID

  filter {
    name   = "name"
    values = ["amazon/ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-server-20240701.1"]
    
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
```

#### Step-07: EC2 Design associate SG
##### Variable
```json
// # AWS EC2 Type
variable "instance_type" {
  description = "EC2 type description"
  type = string
  default = "t2.micro"
}

// # AWS instance key pair
variable "instance_keypair" {
  description = "Keypair of EC2"
  type = string
  default = "terraform-key"
}

// # AWS Private Instance
variable "private_instance" {
  description = "AWS EC2 Private Instance"
  type = number
  default = 1
}
```
##### Outputs
```json

```
##### Bastion
```json
// # AWS EC2 Instance terraform module
// # Bastion Host
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws//examples/complete"
  version = "5.6.1"
  name = "${var.env_development}-Bastion Host"
  #instance_type = 5
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  #monitoring = true
  subnet_id = module.vpc-test.public_subnets[0]
  #vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  tags = local.common_tags
}
```
##### Private

#### Step-08: Elastic IP Configure
#### Step-09: EC2 Auto TFVARS
```bash
instance_type = "t2.micro"
instance_keypair = "terraform-key"
private_instance_count = 2
```
#### Step-10: Null Resource Provisioners
#### Step-11: Terraform TFVARS
#### Step-12: VPC Auto TFVARS