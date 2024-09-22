variable "instance_type" {
  description = "the instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_keypair" {
  description = "keypair for bastion ec2 instance"
  type        = string
  default     = "terraform-key"
}

variable "private_instance_count" {
  description = "count the private ec2 instance"
  type        = number
  default     = 1
}

