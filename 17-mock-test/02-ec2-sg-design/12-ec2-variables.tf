# AWS EC2 Type
variable "instance_type" {
  description = "EC2 type description"
  type = string
  default = "t2.micro"
}

# AWS instance key pair
variable "instance_keypair" {
  description = "Keypair of EC2"
  type = string
  default = "terraform-key"
}