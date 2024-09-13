variable "instance_type_list" {
  description = "EC2 Instance Type List"
  type        = list(string)
  default     = ["t3.micro", "t3.small", "t3.large"]
}

variable "instance_type_map" {
  description = "EC2 Instance Type Map"
  type        = map(string)
  default = {
    "dev"   = "t3.micro"
    "stage" = "t3.small"
    "prod"  = "t3.large"
  }
}
