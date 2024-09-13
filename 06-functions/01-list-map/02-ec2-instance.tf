# Reference the EC2 Instance from List
resource "aws_instance" "example_list" {
  instance_type = var.instance_type_list[1] # Refer Index 0 (t3.micro)
  count         = 3                         # 0, 1, 2 >> ["t3.micro", "t3.small", "t3.large"]
  tags = {
    "name" = "example-instance-${count.index}"
  }
}

# Reference the EC2 Instance from Map
resource "aws_instance" "example_map" {
  instance_type = var.instance_type_map["prod"] # Refer prod key (t3.large)
  count         = 3                             # 0, 1, 2 >> ["t3.micro", "t3.small", "t3.large"]
  tags = {
    "name" = "example-instant-${count.index}"
  }
}
