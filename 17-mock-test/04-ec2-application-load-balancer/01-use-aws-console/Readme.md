### AWS Application Load Balancer
#### Step:01 Introduction
- [Application Load Balancer](https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/latest)
- Reuse Security Group for Load Balancers
#### Step:02 Create EC2 Instance
- Press `Launch instance` Enter name `alb-instance`.
- Select AMI `ubuntu` & Instance type `t2.micro`
- Create key pairs named `kp-alb`.
- Create security group named `sg-alb` with SSH, HTTP & IP 0.0.0.0/0.
- Click (Advanced details) & upload the `app-one.sh` file & making 
- Number of instances are 2
- Check instances
  - publicIPInstance-1:80 (e.g http://3.133.79.65:80/)
  - publicIPInstance-2:80 (e.g http://3.145.76.218:80/)
#### Step:03 Create Target Group
- Create target group name `tg-alb`
- Select Protocol & Port
- Select VPC & Protocol version
- Assign Health checks `/myapp/index.html`
- Click `Advanced health check settings` is default & go `Next`
- In Register targets select all instances & press `Include as pending below`
- Press `Create target group`
#### Step:04 Create Application Load Balancer
- Create application load balancer named `lb-alb`
- Select VPC
- Select Availability Zones & Subnets
- Select Security groups `sg-alb`
- Select `Listeners and routing` & forward to target group named `tg-alb`
- Press `Create load balancer`
- Check instances
  - http://publicIPInstance-1/myapp/index.html
  - http://publicIPInstance-1/myapp/metadata.html
  - http://publicIPInstance-2/myapp/index.html
  - http://publicIPInstance-2/myapp/metadata.html
#### Step:05 Verify the Follow
- Check it using `DNS name` e.g; 
  - http://lb-alb-1748865357.us-east-2.elb.amazonaws.com
  - http://lb-alb-1748865357.us-east-2.elb.amazonaws.com/myapp/index.html
  - http://lb-alb-1748865357.us-east-2.elb.amazonaws.com/myapp/metadata.html
#### Step:06 Clean Up
- Delete the Load Balancer
- Delete Target Group
- Terminate Two Instance
- Delete Key Pair & Security