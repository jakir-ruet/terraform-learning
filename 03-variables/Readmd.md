#### Variable
In Terraform, variables are used to make configurations more flexible and reusable. By defining variables, you can parameterize your infrastructure, allowing you to input different values without changing the code itself. This is especially useful for managing different environments (like development, staging, and production) with the same configuration code. Types of  variables
- Input Variables
- Output Values
- [Local Values](https://developer.hashicorp.com/terraform/language/values/locals): A local value assigns a name to an expression, so you can use the name multiple times within a module instead of repeating the expression.