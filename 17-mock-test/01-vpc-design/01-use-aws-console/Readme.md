### Welcome to Create Virtual Private Cloud (VPC)
#### Step-01: Create VPC
- VPC Name: `vpc-test`
- IPv4 CIDR Block: `10.0.0.0/16`
- Tag: `tg-vpc-test`
- Press Create

#### Step-02: Public & Private Subnets

   ##### Create Public Subnets
   - VPC ID: `vpc-test`
   - Subnet Name: `subnet-public-1`
   - Availability Zone: `us-east-2a`
   - IPv4 CIDR Block: `10.0.1.0/24`
   - Tag: `tg-subnet-public-1`
   - Press Create

   ##### Create Private Subnets
   - VPC ID: `vpc-test`
   - Subnet Name: `subnet-private-1`
   - Availability Zone: `us-east-2a`
   - IPv4 CIDR Block: `10.0.2.0/24`
   - Tag: `tg-subnet-private-1`
   - Press Create

#### Step-03: Create Internet Gateway (IGW) & associate to VPC
-  IGW Name: `igw-three-tier-app`
-  Tag: `tg-igw-three-tier-app`
-  Press to Create
-  Go action menu > Attach to `vpc-test`
-  Press `Attach internet gateway`

#### Step-04: Create NAT Gateway
- Name: `ngw-three-tier-app`
- Subnet: `subnet-private-1`
- Select: `Connectivity Type` [Public >> can directly communicate internet. But, Private >> can't directly communicate internet. In my case `Public` is applicable]
- Press `Allocate Elastic IP` [Its Billable, be careful]
- Tag: `tg-ngw-three-tier-app`
- Press to Create

#### Step-05: Create Public Route Table (RT) & Integrate through Internet Gateway (IGW) and associate public subnets

   ##### Create Public Route Table (RT)
   - Name: `rt-public-1`
   - VPC: `vpc-test`
   - Tag: `tg-rt-public-1`
   - Press Create route table

   ##### Create `public route` in newly created route table
   - Select `rt-public-1`
   - Click on action menu `Edit routes`  `Add Route`
   - Destination: `0.0.0.0/0` [Open for all from anywhere]
   - Target `Internet Gateway` & select `igw-three-tier-app`
   - Press Save changes

   ##### Associate Public Subnets (subnet-public-1) in Route Table
   - Select `rt-public-1`
   - Click `Subnet associations` & `Edit Subnet Associations`
   - Select `subnet-public-1`
   - Press Save associations

#### Step-06 & Final: Create Private Route Table (RT) & Integrate through NAT Gateway (NGW) and associate private subnets

   ##### Create Private Route Table (RT)
   - Name: `rt-private-1`
   - VPC: `vpc-test`
   - Tag: `tg-rt-private-1`
   - Press Create route table

   ##### Create `private route` in newly created route table
   - Select `rt-private-1`
   - Click on action menu `Edit routes`  `Add Route`
   - Destination: `0.0.0.0/0` [Open for all from anywhere]
   - Target `NAT Gateway` & select `ngw-three-tier-app`
   - Press Save changes

   ##### Associate Private Subnets (subnet-private-1) in Route Table
   - Select `rt-private-1`
   - Click `Subnet associations` & `Edit Subnet Associations`
   - Select `subnet-private-1`
   - Press Save associations

##### 👍👍👍 Done 👍👍👍

