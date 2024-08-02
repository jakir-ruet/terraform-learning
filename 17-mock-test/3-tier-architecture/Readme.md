#### This section (Chapter: 17-mock-test) is a completely hands-on base section.
I will discuss Amazon Web Service (AWS) and Terraform as well. Here, I will complete this job using two methodologies that is shown below
1. Using [AWS Console Management](https://github.com/jakir-ruet/terraform-learning/blob/master/17-mock-test/3-tier-architecture/01-use-aws-console/Readme.md)
2. Using [Terraform](https://github.com/jakir-ruet/terraform-learning/blob/master/17-mock-test/3-tier-architecture/02-use-terraform/Readme.md) [Recommended]

##### 🚴 Let's get started.

##### Design three tier application using Terraform

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