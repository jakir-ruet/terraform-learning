#### [Expression](https://developer.hashicorp.com/terraform/language/expressions)
#### Conditional Operators
Its allow you to perform simple if-else logic within your configuration. This is useful for setting values based on conditions, enabling more dynamic and flexible infrastructure definitions. The primary conditional operator in Terraform is the ternary operator, which follows this syntax:
```bash
condition ? true_value : false_value
```
Use of Conditional Operators
```json
variable "environment" {
  description = "The environment to deploy resources in"
  type        = string
  default     = "dev"
}

resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = var.environment == "prod" ? "t2.large" : "t2.micro"
}
```