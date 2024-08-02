#### Design three tier application using Terraform

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

