### Design three tier application using AWS Management Console

#### Step-01: Road Map
- Create VPC
- Create Private and Public Subnets
- Create Internet Gateway (IGW) & associate to VPC
- Create Public Route Table (RT) & Integrate through Internet Gateway (IGW) and associate public subnets
- Create Private Route Table (RT) & Integrate through NAT Gateway and associate private subnets

#### Step-02: Create VPC
- VPC Name: vpc-test
- IPv4 CIDR Block: 10.0.0.0/16
Press Create

#### Step-03: Public & Private Subnets

##### Public Subnets
- VPC ID: vpc-test
- Subnet Name: subnet-public-1
- Availability Zone: us-east-2a
- IPv4 CIDR Block: 10.0.1.0/24

##### Private Subnets
- Subnet Name: subnet-private-1
- Availability Zone: us-east-2a
- IPv4 CIDR Block: 10.0.101.0/24
Press Create

#### Step-04: Create Internet Gateway (IGW) & associate to VPC
-  IGW Name: igw-three-tier
-  Go action menu > Attach to `vpc-test` press `Attach internet gateway`

#### Step-05: Create NAT Gateway
- Name: nat-gateway
- Subnet: subnet-private-1
- Press `Allocate Elastic IP`
- Select Public &
Press to Create

#### Step-06: Create public Route Table (RT) & associate subnets

##### Create Route Table (RT)
- Name: rt-public-1
- VPC: vpc-test
Press to Create

##### Create public route in newly created route table
- Click on `Edit routes` > `Add Route`
- Destination: 0.0.0.0/0
- Target: igw-three-tier
Create to Press

##### Associate public subnet-1 in Route Table
- Click `Edit Subnet Associations`
- Select `ps-subnet-public-1`
Save to Press

#### Step-07 & Final: Create private Route Table (RT) & associate subnets

##### Create Route Table (RT)
- Name: rt-private-1
- VPC: vpc-test
Press to Create

##### Create private route in newly created route table
- Click on `Edit routes` > `Add Route`
- Destination: 0.0.0.0/0
- Target: nat-gateway
Create to Press

##### Associate private subnet-1 in Route Table
- Click `Edit Subnet Associations`
- Select `ps-subnet-private-1`
Save to Press

##### 👍👍👍 Done 👍👍👍

