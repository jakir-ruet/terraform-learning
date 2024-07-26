output "public-ip-address" {
  value = aws_instance.my-ec2-instance.public_ip
}