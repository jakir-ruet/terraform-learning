provider "aws" {
  region = "us-east-2"
}
variable "students" {
  type = list(object({
    name  = string
    class = string
  }))

  default = [{
    name  = "Fahmid"
    class = "One"
    },
    {
      name  = "Tahmid"
      class = "Six"
  }]
}

# Using loop
output "namesLoop" {
  value = [for student in var.students : student.name]
}

# Using Splat expresstion
output "names" {
  value = var.students[*].name
}
output "classes" {
  value = var.students[*].class
}
