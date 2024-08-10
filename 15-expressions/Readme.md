### [Expression](https://developer.hashicorp.com/terraform/language/expressions)

#### [Function Calls](https://developer.hashicorp.com/terraform/language/expressions/function-calls)
- `min(35, 56, 78)`
- `max(35, 56, 78)`

#### [Conditional](https://developer.hashicorp.com/terraform/language/expressions/conditionals)
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

resource "aws_instance" "my-instance" {
  ami           = "ami-123456"
  instance_type = var.environment == "prod" ? "t2.large" : "t2.micro"
}
```

#### [For Expression](https://developer.hashicorp.com/terraform/language/expressions/for)
```t
[for s in var.list : upper(s)]
```