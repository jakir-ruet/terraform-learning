#### Resources
In Terraform, a resource block defines a specific piece of infrastructure that Terraform will manage. Each resource block represents a single unit of infrastructure, such as an AWS EC2 instance, an S3 bucket, or a DNS record. Resources are the primary way to define and create infrastructure components in Terraform.

##### Dependencies
Terraform automatically handles dependencies between resources. For example, if you create an EC2 instance that depends on a VPC or subnet, Terraform will ensure that the VPC and subnet are created first.

##### Lifecycle
Terraform manages the lifecycle of resources with operations like create, update, and delete.