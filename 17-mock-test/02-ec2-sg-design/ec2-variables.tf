# AWS instance
variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# AWS EC2 instance key pair
variable "instance_keypain" {
  description = "AWS EC2 key pair"
  type        = string
  default     = "terraform-key"
}

# AWS EC2 private instance count
variable "private_instance_count" {
  description = "AWS EC2 private instance"
  type        = number
  default     = 1
}
