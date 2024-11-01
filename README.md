[![LinkedIn][linkedin-shield-lapissoft]][linkedin-url-lapissoft]
[![Facebook-Page][facebook-shield-lapissoft]][facebook-url-lapissoft]
[![Youtube][youtube-shield-lapissoft]][youtube-url-lapissoft]

## Visit Us [Lapis Soft](http://www.lapissoft.com)
### Terraform Language Basic
#### Introduction
Terraform, an open source “Infrastructure as Code” tool created by HashiCorp, allows programmers to build, change and version infrastructure safely and efficiently. Users define and provide data center infrastructure using a Declarative Configuration Language (DCL) known as HashiCorp Configuration Language (HCL), or optionally JSON. Terraform's extensible plugin-based architecture supports a wide range of providers, enabling seamless integration and management of diverse infrastructure environments.

Terraform is an infrastructure as code (IaC) tool that lets you build, change, and version `cloud` and `on-prem` resources safely and efficiently. Its can manage low-level components like `compute`, `storage`, and `networking resources`, as well as high-level components like DNS entries and SaaS features.

#### [Command Line Interface (CLI)](https://developer.hashicorp.com/terraform/cli)
Terraform Command Line Interface (CLI) to manage infrastructure, and interact with Terraform state, providers, configuration files, and Terraform Cloud.

The Terraform CLI is a command-line tool used to manage infrastructure as code (IaC). It enables users to define, preview, and apply changes to infrastructure resources using configuration files written in HashiCorp Configuration Language (HCL) or JSON.

#### How does Terraform work?
Terraform creates and manages resources on cloud platforms and other services through their application programming interfaces (APIs). Providers (AWS, Azure, GCP) enable Terraform to work with virtually any platform or service with an accessible API. The core Terraform workflow consists of `three` stages:
![Terraform Work](/img/how-work.png)

- **Write:** In the writing phase, you create configuration files using HashiCorp Configuration Language (HCL) or JSON. These configuration files define the desired state of your infrastructure.
  - **Configuration Files:** These files include resources, variables, providers, and modules.
  - **Providers:** Define the infrastructure providers (e.g., AWS, Azure, Google Cloud).
  - **Resources:** Define the components of your infrastructure (e.g., EC2 instances, Virtual Private Cloud `VPC` S3 buckets).
- **Plan:** Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.
- **Apply:** On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines.
![Workflow Stages](/img/workflow-stage.png)

#### Benefits of using Terraform?
Terraform revolutionized infrastructure management by introducing the concept of Infrastructure as Code (laC), which inherently takes advantage of these advancements to manage infrastructure more effectively. Lets' take a look at a few of the benefits Terraform has to offer.
- Consistency 
- Automation 
- Less Risk
- Modular & DRY

#### Key Features
Some of the key features of Terraform that make it a versatile and powerful tool for managing infrastructure include:
  - Declarative
  - Cloud Agnostic
  - Ecosystem
  - Extendible
  - Agent less

#### [Installation of Terraform](https://developer.hashicorp.com/terraform/install)
Version check
```bash
terraform version
```

Install in CodeSpace
```bash
wget https://releases.hashicorp.com/terraform/1.4.5/terraform_1.4.5_linux_amd64.zip
unzip terraform_1.4.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform --version
terraform -help
```
If any problem related to path variable
```bash
export PATH=$PATH:/usr/local/bin
source ~/.bashrc
```

#### [Installation of AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
```bash
aws --version
aws configure
```
Configuration `Identity and Access Management (IAM)` on AWS Console.
- AWS Access Key ID [None]: Put your ID here and press Enter.
- AWS Secret Access Key [None]: Put your secret key here and press Enter
- Default region name [None]: us-east-2
- Default output format [None]: json
- Check the users `aws iam list-users`
- Check the s3 resources `aws s3 ls`

#### Basic Command

There are a handful of basic terraform commands, including:
|  SL   | Command              | Explanation                            |
| :---: | :------------------- | :------------------------------------- |
|   1   | `terraform init`     | Initialize Terraform Working Directory |
|   2   | `terraform validate` | Validating a Configuration             |
|   3   | `terraform plan`     | Generating a Terraform Plan            |
|   4   | `terraform apply`    | Applying a Terraform Plan              |
|   5   | `terraform destroy`  | TerraformDestroy                       |

**NB: Keep to clean the application**
```bash
rm -rf .terraform*
rm -rf terraform.tfstate*
```
[Workflow](https://developer.hashicorp.com/terraform/intro/core-workflow)

### Basic Syntax
Understand Terraform Configuration Language's Basics
  - Understand Variables
  - Understand Blocks
  - Understand Arguments
  - Understand Attributes
  - Understand Meta-Arguments
  - Understand Identifiers
  - Understand Comments

#### Variables
In Terraform, variables are used to make configurations more flexible and reusable. By defining variables, you can parameterize your infrastructure, allowing you to input different values without changing the code itself. This is especially useful for managing different environments (like development, staging, and production) with the same configuration code. Types of  variables
- **Input Variables** Its used to parameterize your Terraform configurations. They allow you to pass values into your modules/configurations from outside. Its define within a module or at the root level of your configuration.
  ```json
  variable "ami" {
    type        = string
    description = "Ubuntu ami_id"
  }
  variable "instance_type" {
    type        = string
    description = "Instance type"
  }
  variable "name_tag" {
    type        = string
    Description = "name of EC2 instance"
  }
  ```
  Use of input variable
  ```json
  resource "aws_instance" "my-aws-instance" {
    ami           = var.ami
    instance_type = var.instance_type
    
    tags = {
      Name = var.name_tag
    }
  }
  ```
- **Output Values** Its allow you to expose the values from your module/configuration, making them available for use in other parts of your Terraform setup.
  ```json
  output "public_ip" {
    value       = aws_instance.my_vm.public_ip 
    description = "Public I P Address o f EC2 instance"
  }
  output "instance_id" {
    value       = aws_instance.my_vm.id 
    description = "Instance ID"
  }
  ```
- **Local Values** are a way to define expressions or intermediate variables that can be reused throughout your configuration. They are similar to variables but are computed locally and are read-only. Local values help make your Terraform configuration more readable, reduce repetition, and make it easier to manage complex logic.
  ```json
  locals {
    environment = "production"
    region      = "us-west-2"
    instance_type = "t2.micro"
    tags = {
      Environment = local.environment
      Project     = "my-project"
    }
    instance_count = 3
  }
  resource "aws_instance" "example" {
    count         = local.instance_count
    ami           = "ami-12345678"
    instance_type = local.instance_type
    tags          = local.tags
    # The region can be used in a provider block or resource
    provider = aws.local.region
  }
  ```

**Some Important Variables**

Simple string variable
```json
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}
```
Variable with validation
```json
variable "environment" {
  description = "The environment to deploy resources in"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of dev, staging, or prod"
  }
}
```
List variable
```json
variable "availability_zones" {
  description = "A list of availability zones to deploy resources in"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}
```
Map variable
```json
variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {
    "environment" = "dev"
    "owner"       = "admin"
  }
}
```
Use Variables
```json
provider "aws" {
  region = var.region
}
resource "aws_instance" "example" {
  ami               = "ami-123456"
  instance_type     = "t2.micro"
  availability_zone = var.availability_zones[0]
  tags              = var.tags
}
```

#### Top Level Blocks
- Fundamental Blocks
  - Settings (Terraform) Block
    ```json
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          #version = "~> 3.21" # Optional but recommended in production
        }
      }
    }
    ```
  - Provider Block
    ```json
    provider "aws" {
      profile = "default" # AWS Credentials Profile configured on your local desktop terminal   $HOME/.aws/credentials
      region  = "us-east-2"
    }
    ```
  - Resource Block
    ```json
    resource "aws_instance" "ec2demo" {
      ami = "ami-04d29b6f966df1537" # Amazon Linux in us-east-2, update as per your region
      instance_type = "t2.micro"
    }
    ```
    **Difference & Comparison of Fundamentals Blocks**
    | Settings (Terraform) Block     | Provider Block                  | Resource Block                |
    | :----------------------------- | :------------------------------ | :---------------------------- |
    | Special & use in configuration | Heat of Terraform               | Assign Infrastructure Objects |
    | Version Required               | Interact with Remote Systems    | Resource Syntax Declare       |
    | Provider List Required         | To install providers & Use them | Resource Behavior Declare     |
    | Terraform Backend              | Configure belong to Root Module | Create Provisioners           |
- Variable Blocks
  - Input Variable Block
    ```json
    variable "instance_type" {
      default = "t2.micro"
      description = "EC2 Instance Type"
      type = string
    }
    ```
  - Output Values Block
    ```json
    output "ec2_instance_publicip" {
      description = "EC2 Instance Public IP"
      value = aws_instance.my-ec2-vm.public_ip
    }
    ```
  - Local Values Block
    ```json
    locals {
      bucket-name-prefix = "${var.app_name}-${var.environment_name}"
    }
    ```
- Calling/Referencing Blocks
  - Data Sources Block
    ```json
    data "aws_ami" "amzlinux" {
      most_recent      = true
      owners           = ["amazon"]

      filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*"]
      }

      filter {
        name   = "root-device-type"
        values = ["ebs"]
      }

      filter {
        name   = "virtualization-type"
        values = ["hvm"]
      }

      filter {
        name   = "architecture"
        values = ["x86_64"]
      }

    }
    ```
  - Modules Block
    ```json
    module "ec2_cluster" {
      source                 = "terraform-aws-modules/ec2-instance/aws"
      version                = "~> 2.0"

      name                   = "my-modules-demo"
      instance_count         = 2

      ami                    = data.aws_ami.amzlinux.id
      instance_type          = "t2.micro"
      key_name               = "terraform-key"
      monitoring             = true
      vpc_security_group_ids = ["sg-08b25c5a5bf489ffa"]  # Get Default VPC Security Group ID and replace
      subnet_id              = "subnet-4ee95470" # Get one public subnet id from default vpc and replace
      user_data               = file("apache-install.sh")

      tags = {
        Terraform   = "true"
        Environment = "dev"
      }
    }
    ```
**Important Notes** within a Terraform Block
- Only constant values can be used.
- Arguments may not refer to named objects such as resources, input variables etc.
- May not use any of Terraform Language built-in functions.

**[Define Infrastructure](https://developer.hashicorp.com/terraform/tutorials/configuration-language/resource)**

Resources have arguments, attributes, and meta-arguments.
- **Arguments** assign a value to a name. They appear within blocks. Its configure a particular resource; because of this, many arguments are resource-specific. Arguments can be required or optional, as specified by the provider. If you do not supply a required argument, Terraform will give an error and not apply the configuration.
  ```json
  resource "aws_instance" "example" {
    ami           = "ami-123456"    # Required argument
    instance_type = "t2.micro"      # Required argument
    key_name      = "my-key"        # Optional argument
    tags = {                        # Optional argument
      Name = "example-instance"
    }
  }
  ```
- **Attributes** are values exposed by an existing resource. References to resource attributes take the format `resource_type.resource_name.attribute_name`. Unlike arguments which specify an infrastructure object's configuration, a resource's attributes are often assigned to it by the underlying cloud provider or API.
  ```json
  resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0"  # Attribute: AMI ID
    instance_type = "t2.micro"               # Attribute: Instance type
    tags = {
      Name = "ExampleInstance"              # Attribute: Tags
    }
  }
  ```
  In this example, `aws_instance` has several attributes such as `ami`, `instance_type` & `tags`
- **Meta-arguments** in Terraform are special arguments that can be used with resource blocks and modules to control their behavior or influence the infrastructure provisioning process. They provide additional configuration options beyond the regular resource-specific arguments such as `depends_on`, `count`, `for_each`, `provider` & `lifecycle` etc.
  ```json
  resource "aws_instance" "example" {
    count = 3                         # Meta-argument: Count
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    
    lifecycle {
      create_before_destroy = true    # Meta-argument: Lifecycle
    }

    tags = {
      Name = "ExampleInstance ${count.index}"  # Unique tags for each instance
    }
  }
  ```

### [Providers](https://developer.hashicorp.com/terraform/language/providers)
Terraform providers are plugins that enable Terraform to manage different infrastructure services. They serve as a bridge between Terraform and various platforms or services, allowing Terraform to manage resources within those services. Providers are defined in the Terraform configuration files using the `provider` block. Popular Providers are
- AWS (Amazon Web Services)
- Azure (Microsoft Azure)
- Google Cloud Platform (GCP)
- Kubernetes

Many others are available and can be found in the [Terraform Registry](https://registry.terraform.io/browse/providers).
```json
provider "aws" {
  region = "us-west-2"
}
```

### [Resources](https://developer.hashicorp.com/terraform/language/resources)
A resource is a component that manages the infrastructure object, such as a virtual machine, a database, or a network. Resources are defined in Terraform configuration files and represent the desired state of an infrastructure component. Terraform then uses these configurations to create, update, and manage the actual infrastructure resources in a cloud or on-premises environment.
```json
provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "my-server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "tg-my-server"
  }
}
```

### Datasources
In Terraform, data sources allow you to fetch information from various providers and external sources, which can be used within your Terraform configurations. They are useful for referencing information that you don't want to hard-code, such as the ID of an existing resource, the latest version of an AMI, or details from another infrastructure component. For example we get latest ami for Ubuntu Linux.

To provide a data source for Ubuntu Linux using a declarative approach in infrastructure-as-code tools, we typically define the source and parameters that specify which Ubuntu AMI to use. Here's how to do it in Terraform and AWS CloudFormation.
```json
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # collect it from AMI menu

   filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-server-20240701.1"]
   }

   filter {
   name = "root_device_type"
   values = ["ebs"]
   }

   filter {
     name = "architecture"
     values = ["x86_64"]
   }

   filter {
      name   = "virtualization-type"
      values = ["hvm"]
   }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "kp-my-datasource" # Replace with your key pair name

  tags = {
    Name = "tg-datasource"
  }
}
```

#### [Functions](https://developer.hashicorp.com/terraform/language/functions)
Terraform has a variety of built-in functions that can be used to perform various operations within your configurations. These functions are divided into several categories based on their use cases:

**String Functions**

`chomp:` Removes trailing newline from a string.
```json
output "result" {
  value = chomp("Hello\n")
}
# result: "Hello"
```
`format:` Produces a formatted string.
```json
output "result" {
  value = format("Hello, %s!", "world")
}
# result: "Hello, world!"
```
`formatlist:` Produces a list of formatted strings.
```json
output "result" {
  value = formatlist("Hello, %s!", ["Alice", "Bob"])
}
# result: ["Hello, Alice!", "Hello, Bob!"]
```
`join:` Concatenates a list of strings into a single string with a specified separator.
```json
output "result" {
  value = join(", ", ["one", "two", "three"])
}
# result: "one, two, three"
```
`lower:` Converts a string to lowercase.
```json
output "result" {
  value = lower("Hello, World!")
}
# result: "hello, world!"
```
`replace:` Replaces occurrences of a substring within a string.
```json
output "result" {
  value = replace("Hello, World!", "World", "Terraform")
}
# result: "Hello, Terraform!"
```
`split:` Splits a string into a list of substrings.
```json
output "result" {
  value = split(", ", "one, two, three")
}
# result: ["one", "two", "three"]
```
`trimspace:` Removes leading and trailing whitespace from a string.
```json
output "result" {
  value = trimspace("   Hello, World!   ")
}
# result: "Hello, World!"
```
`upper:` Converts a string to uppercase.
```json
output "result" {
  value = upper("Hello, World!")
}
# result: "HELLO, WORLD!"
```

**Numeric Functions**

`abs:` Returns the absolute value of a number.
```json
output "result" {
  value = abs(-42)
}
# result: 42
```
`ceil:` Rounds a number up to the nearest integer.
```json
output "result" {
  value = ceil(7.2)
}
# result: 8
```
`floor:` Rounds a number down to the nearest integer.
```json
output "result" {
  value = floor(7.8)
}
# result: 7
```
`max:` Returns the maximum value from a list of numbers.
```json
output "result" {
  value = max(1, 2, 3, 4, 5)
}
# result: 5
```
`min:` Returns the minimum value from a list of numbers.
```json
output "result" {
  value = min(1, 2, 3, 4, 5)
}
# result: 1
```

**Collection Functions**

`chunklist:` Splits a list into chunks of a specified size.
```json
output "result" {
  value = chunklist([1, 2, 3, 4, 5, 6], 2)
}
# result: [[1, 2], [3, 4], [5, 6]]
```
`coalescelist:` Returns the first non-empty list from a list of lists.
```json
output "result" {
  value = coalescelist([], [1, 2], [3, 4])
}
# result: [1, 2]
```
`compact:` Removes empty string elements from a list.
```json
output "result" {
  value = compact(["one", "", "three"])
}
# result: ["one", "three"]
```
`concat:` Concatenates multiple lists into one list.
```json
output "result" {
  value = concat(["one", "two"], ["three", "four"])
}
# result: ["one", "two", "three", "four"]
```
`contains:` Checks if a list contains a given element.
```json
output "result" {
  value = contains(["one", "two", "three"], "two")
}
# result: true
```
`distinct:` Removes duplicate elements from a list.
```json
output "result" {
  value = distinct(["one", "two", "one", "three"])
}
# result: ["one", "two", "three"]
```
`element:` Returns the element at a specified index in a list.
```json
output "result" {
  value = element(["one", "two", "three"], 1)
}
# result: "two"
```
`flatten:` Flattens a list of lists into a single list.
```json
output "result" {
  value = flatten([["one", "two"], ["three", "four"]])
}
# result: ["one", "two", "three", "four"]
```
`index:` Returns the index of the first occurrence of an element in a list.
```json
output "result" {
  value = index(["one", "two", "three"], "two")
}
# result: 1
```
`keys:` Returns a list of keys from a map.
```json
output "result" {
  value = keys({a = 1, b = 2, c = 3})
}
# result: ["a", "b", "c"]
```
`length:` Returns the length of a list, map, or string.
```json
output "result" {
  value = length(["one", "two", "three"])
}
# result: 3
```
`lookup:` Retrieves the value of a key from a map.
```json
output "result" {
  value = lookup({a = 1, b = 2}, "b", 0)
}
# result: 2
```
`merge:` Merges multiple maps into one map.
```json
output "result" {
  value = merge({a = 1, b = 2}, {c = 3})
}
# result: {a = 1, b = 2, c = 3}
```
`range:` Generates a list of numbers within a specified range.
```json
output "result" {
  value = range(5)
}
# result: [0, 1, 2, 3, 4]
```
`reverse:` Reverses the order of elements in a list.
```json
output "result" {
  value = reverse(["one", "two", "three"])
}
# result: ["three", "two", "one"]
```
`setintersection:` Returns the common elements in two lists.
```json
output "result" {
  value = setintersection(["one", "two"], ["two", "three"])
}
# result: ["two"]
```
`setsubtract:` Returns the elements in one list that are not in another list.
```json
output "result" {
  value = setsubtract(["one", "two"], ["two", "three"])
}
# result: ["one"]
```
`setunion:` Returns the union of two lists.
```json
output "result" {
  value = setunion(["one", "two"], ["two", "three"])
}
# result: ["one", "two", "three"]
```
`slice:` Extracts a portion of a list.
```json
output "result" {
  value = slice(["one", "two", "three", "four"], 1, 3)
}
# result: ["two", "three"]
```
`sort:` Sorts a list of strings.
```json
output "result" {
  value = sort(["three", "one", "two"])
}
# result: ["one", "two", "three"]
```
`transpose:` Transposes a list of lists.
```json
output "result" {
  value = transpose([["a", "b"], ["c", "d"]])
}
# result: [["a", "c"], ["b", "d"]]
```
`values:` Returns a list of values from a map.
```json
output "result" {
  value = values({a = 1, b = 2, c = 3})
}
# result: [1, 2, 3]
```
`zipmap:` Creates a map from a list of keys and a list of values.
```json
output "result" {
  value = zipmap(["a", "b", "c"], [1, 2, 3])
}
# result: {a = 1, b = 2, c = 3}
```

**Date and Time Functions**

`formatdate:` Formats a timestamp according to a specified layout.
```json
output "result" {
  value = formatdate("DD/MM/YYYY", "2024-07-25T14:00:00Z")
}
# result: "25/07/2024"
```
`timeadd:` Adds a duration to a timestamp.
```json
output "result" {
  value = timeadd("2024-07-25T14:00:00Z", "72h")
}
# result: "2024-07-28T14:00:00Z"
```

**Filesystem Functions**

`file:` Reads the contents of a file.
```json
output "result" {
  value = file("example.txt")
}
# result: (contents of example.txt)
```
`filebase64:` Reads the contents of a file and encodes it as base64.
```json
output "result" {
  value = filebase64("example.txt")
```
`filebase64sha256:` Reads the contents of a file, encodes it as base64, and computes its SHA-256 hash.
```json

```
`filebase64sha512:` Reads the contents of a file, encodes it as base64, and computes its SHA-512 hash.
```json
output "file_base64_sha512_hash" {
  value = filebase64sha512("example.txt")
}
```
`filemd5:` Reads the contents of a file and computes its MD5 hash.
```json
output "file_md5_hash" {
  value = filemd5("example.txt")
}
```
`filesha1:` Reads the contents of a file and computes its SHA-1 hash.
```json
output "file_sha1_hash" {
  value = filesha1("example.txt")
}
```
`filesha256:` Reads the contents of a file and computes its SHA-256 hash.
```json
output "file_sha256_hash" {
  value = filesha256("example.txt")
}
```
`filesha512:` Reads the contents of a file and computes its SHA-512 hash.
```json
output "file_sha512_hash" {
  value = filesha512("example.txt")
}
```
`templatefile:` Renders a template file with the provided variables.
```json
Hello, ${name}!
Welcome to ${location}.
```
```json
variable "name" {
  default = "John Doe"
}

variable "location" {
  default = "Terraform World"
}

output "greeting" {
  value = templatefile("example.tpl", {
    name     = var.name
    location = var.location
  })
}
```
**Encoding Functions**

`base64decode:` Decodes a base64-encoded string.
```json
output "decoded_string" {
  value = base64decode("SGVsbG8gV29ybGQh")
}
# result: "Hello World!"
```
`base64encode:` Encodes a string as base64.
```json
output "encoded_string" {
  value = base64encode("Hello World!")
}
# result: "SGVsbG8gV29ybGQh"
```
`base64gzip:` Compresses a string and encodes it as base64.
```json
output "base64_gzip_encoded_string" {
  value = base64gzip("Hello World!")
}
# result: The base64-encoded, gzip-compressed version of "Hello World!"
```
`base64sha256:` Computes the SHA-256 hash of a string and encodes it as base64.
```json
output "base64_sha256_hash" {
  value = base64sha256("Hello World!")
}
# result: The base64-encoded SHA-256 hash of "Hello World!"
```
`base64sha512:` Computes the SHA-512 hash of a string and encodes it as base64.
```json
output "base64_sha512_hash" {
  value = base64sha512("Hello World!")
}
# result: The base64-encoded SHA-512 hash of "Hello World!"
```
`bcrypt:` Hashes a string using bcrypt.
```json
output "bcrypt_hash" {
  value = bcrypt("password123")
}
# result: The bcrypt hash of "password123"
```
`csvdecode:` Parses a CSV string into a list of maps.
```json
output "csv_decoded" {
  value = csvdecode("name,age\nJohn Doe,30\nJane Doe,25")
}
# result: [
#   { name = "John Doe", age = "30" },
#   { name = "Jane Doe", age = "25" }
# ]
```
`jsondecode:` Parses a JSON string into a map or list.
```json
output "json_decoded" {
  value = jsondecode("{\"name\":\"John Doe\",\"age\":30}")
}
# result: {
#   name = "John Doe"
#   age  = 30
# }
```
`jsonencode:` Encodes a map or list as a JSON string.
```json
output "json_encoded" {
  value = jsonencode({
    name = "John Doe"
    age  = 30
  })
}
# result: "{\"name\":\"John Doe\",\"age\":30}"
```
`urlencode:` Encodes a string as a URL component.
```json
output "url_encoded" {
  value = urlencode("Hello World!")
}
# result: "Hello%20World%21"
```
`yamldecode:` Parses a YAML string into a map or list.
```json
output "yaml_decoded" {
  value = yamldecode("name: John Doe\nage: 30")
}
# result: {
#   name = "John Doe"
#   age  = 30
# }
```
`yamlencode:` Encodes a map or list as a YAML string.
```json
output "yaml_encoded" {
  value = yamlencode({
    name = "John Doe"
    age  = 30
  })
}
# result: "age: 30\nname: John Doe\n"
```

**Hash and Crypto Functions**

`bcrypt:` Generates a bcrypt hash of a string.
```json
output "file_sha512_hash" {
  value = filesha512("example.txt")
}
# result: The SHA-512 hash of the file contents
```
`md5:` Computes the MD5 hash of a string.
```json
output "md5_hash" {
  value = md5("Hello World!")
}
# result: The MD5 hash of the string "Hello World!"
```
`sha1:` Computes the SHA-1 hash of a string.
```json
output "sha1_hash" {
  value = sha1("Hello World!")
}
# result: The SHA-1 hash of the string "Hello World!"
```
`sha256:` Computes the SHA-256 hash of a string.
```json
output "sha256_hash" {
  value = sha256("Hello World!")
}
# result: The SHA-256 hash of the string "Hello World!"
```
`sha512:` Computes the SHA-512 hash of a string.
```json
output "sha512_hash" {
  value = sha512("Hello World!")
}
# result: The SHA-512 hash of the string "Hello World!"
```

**IP Network Functions**

`cidrhost:` Calculates an IP address within a CIDR block.
```json
output "host_ip" {
  value = cidrhost("192.168.1.0/24", 10)
}
# result: "192.168.1.10"
```
`cidrnetmask:` Computes the netmask of a CIDR block.
```json
output "netmask" {
  value = cidrnetmask("192.168.1.0/24")
}
# result: "255.255.255.0"
```
`cidrsubnet:` Computes a subnet within a CIDR block.
```json
output "subnet" {
  value = cidrsubnet("10.0.0.0/8", 8, 5)
}
# result: "10.5.0.0/16"
```
`cidrsubnets:` Computes multiple subnets within a CIDR block.
```json
output "subnets" {
  value = cidrsubnets("10.0.0.0/8", 4, 4)
}
# result: ["10.0.0.0/12", "10.16.0.0/12", "10.32.0.0/12", "10.48.0.0/12"]
```

**Type Conversion Functions**

`tobool:` Converts a value to a boolean.
```json
output "to_bool_true" {
  value = tobool("true")
}
# result: true

output "to_bool_false" {
  value = tobool("false")
}
# result: false
```
`toint:` Converts a value to an integer.
```json
variable "string_number" {
  default = "42"
}

locals {
  integer_value = toint(var.string_number)
}

output "integer_value" {
  value = local.integer_value
}
```
`tolist:` Converts a value to a list.
```json
output "to_list" {
  value = tolist(["one", "two", "three"])
}
# result: ["one", "two", "three"]
```
`map:` Converts a value to a map.
```json
output "to_map" {
  value = tomap({
    "key1" = "value1",
    "key2" = "value2"
  })
}
# result: {
#   "key1" = "value1",
#   "key2" = "value2"
# }
```
`tonumber:` Converts a value to a number.
```json
output "to_number" {
  value = tonumber("42")
}
# result: 42
```
`toset:` Converts a value to a set.
```json
output "to_set" {
  value = toset(["a", "b", "c"])
}
# result: ["a", "b", "c"]
```
`tostring:` Converts a value to a string.
```json
output "to_string" {
  value = tostring(42)
}
# result: "42"
```

### [State Management](https://developer.hashicorp.com/terraform/language/state)
State management in Terraform is a crucial concept for tracking and managing the resources that Terraform `creates`, `updates`, and `deletes`. In Terraform, the `statefile` and `remote backend` are crucial components for managing and maintaining infrastructure as code. Here’s a detailed overview of state management in Terraform:

**State**
Terraform state is a file that tracks the resources managed by Terraform. It acts as a source of truth for Terraform about the infrastructure it manages, storing information about resource attributes and metadata.

**Statefile**
A Terraform state file is a JSON file that contains detailed information about the resources managed by Terraform. This file, often named `terraform.tfstate`, is a JSON or HCL (HashiCorp Configuration Language) formatted file that contains important information about the infrastructure's current state, such as resource attributes, dependencies, and metadata. Here’s a simplified example of what a state file might look like:
```json
{
  "version": 4,
  "terraform_version": "1.2.3",
  "resources": [
    {
      "type": "aws_instance",
      "name": "example",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "ami": "ami-0c55b159cbfafe1f0",
            "id": "i-1234567890abcdef0",
            "instance_type": "t2.micro",
            "tags": {
              "Name": "example-instance"
            },
            "private_ip": "10.0.0.1",
            "public_ip": "54.123.45.67",
            "subnet_id": "subnet-0bb1c79de4EXAMPLE"
          },
          "private": "encrypted_state_file_contents"
        }
      ]
    }
  ],
  "outputs": {
    "instance_id": {
      "value": "i-1234567890abcdef0",
      "type": "string"
    }
  },
  "terraform_version": "1.2.3"
}
```

**Importance**
- **Tracking Resources:** It maintains a record of all resources managed by Terraform, including their IDs, addresses, and other relevant information.
- **Efficient Planning:** By comparing the desired state with the actual state, Terraform can optimize the changes required.
- **Idempotency:** Terraform can safely be run multiple times without unintended consequences due to the state file.
- **Dependency Management:** Terraform understands the dependencies between resources and manages their creation and destruction in the correct order.
- **Concurrency Control:** For locking the resources to preventing multiple users processes from modifying the same resource simultaneously. This helps avoid conflicts and ensures data consistency.
- **Resource Metadata:** The state file stores metadata about each resource, such as unique identifiers, which is crucial for managing resources and understanding their relationships.
- **Data loss:** If the local machine crashes or the statefile is accidentally deleted, the infrastructure state information is lost.
- **Limited accessibility:** The statefile is only available on the local machine, making it difficult to share and collaborate.

**Disadvantage**
- **Inconsistent state:** If the managed infrastructure changes outside of Terraform (e.g., manual changes), the state file might not accurately reflect the actual state.
- **Unexpected behavior:** Terraform might apply unintended changes when the state file is out of sync with the infrastructure.
- **Security Issue:** The state file might contain sensitive information about your infrastructure, such as resource names, addresses, and configurations.
- **Concurrency issues:** When multiple users or processes attempt to modify the state file simultaneously, it can lead to locking conflicts and delays.
- **Reduced efficiency:** Locking can impact the overall performance of Terraform operations.
- **Unauthorized access:** If the state file is not properly protected, it could be accessed by unauthorized individuals.

#### Remote Backend
A remote backend in Terraform is a mechanism for storing the Terraform state file in a remote location instead of locally on your machine. This is crucial for collaborative projects, larger infrastructures, and when you need increased reliability and security for your state data.

**Use Case**
- **Collaboration:** Multiple team members can access and modify the state file simultaneously.
- **Reliability:** The state file is stored in a highly available and durable storage system.
- **Security:** Some remote backends offer encryption and access controls.
- **Versioning:** Many remote backends support state versioning, allowing you to revert to previous states if needed.

**Common Remote Backend Options**

Terraform offers several built-in remote backend options:
- **Amazon S3:** Object storage provided by AWS.
- **Azure Blob Storage:** Object storage provided by Azure.
- **Google Cloud Storage:** Object storage provided by Google Cloud.
- **HashiCorp Consul:** Distributed key-value store.
- **Terraform Cloud:** Cloud-based platform for Terraform collaboration and management.
Configuring a Remote Backend

To use a remote backend, you define it in the terraform block of your configuration file:
```json
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
```

**Overcoming the disadvantage of Statefile (e.g., S3)**

To address and overcome the disadvantages of using a state file in Terraform, particularly when stored in a remote backend like Amazon S3, consider implementing the following best practices and strategies:
1. Making Amazon S3 and using Remote Backend for storing `State File` due it will update automatically. There is no chance of conflict. 
2. State Locking: When using S3 as a backend, pair it with a state locking mechanism like DynamoDB. This prevents concurrent modifications and ensures that only one process can modify the state file at a time.
```json
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "/path/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
```

#### [Workspaces](https://developer.hashicorp.com/terraform/cloud-docs/workspaces)
  In Terraform, workspaces are a way to manage multiple instances of a single Terraform configuration. Each workspace maintains its own state file, which allows you to manage different environments (e.g., development, staging, production) without having to create separate configurations for each.

  **Key Concepts**
- **Default Workspace:** Every Terraform configuration starts with a single workspace named `default`. All commands that manage state, plan, and apply changes are done in this default workspace unless otherwise specified.
- **Isolated State:** Each workspace has its own state file, which is used to store information about the infrastructure managed by Terraform.
- **Environment Management:** Workspaces allow you to manage different environments (like dev, staging, and prod) using the same configuration.
- **Easy Switching:** You can switch between workspaces using simple Terraform commands.
- **Custom Workspaces:** You can create additional workspaces to manage different states.

  **Prerequisites**

- An HCP Terraform account and organization
- Terraform v1.1+ installed locally and configured with your HCP Terraform token
- An AWS account
- A GitHub account

```bash
terraform init
terraform workspace new development
terraform workspace list
terraform workspace select development
terraform workspace show
terraform plan
terraform apply
terraform workspace delete development
```

### [Null Resource](https://developer.hashicorp.com/terraform/language/resources/provisioners/null_resource)
The `null_resource` resource implements the standard resource lifecycle but takes no further action. Instead, it acts as a placeholder that can trigger actions based on changes to other resources or inputs. It's a special type of resource that doesn't actually create any infrastructure like as AWS, GCP & Azure.

#### Triggers
The triggers argument allows specifying an arbitrary set of values that, when changed, will cause the resource to be replaced.

### [Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)
Provisioners in Terraform are used to execute scripts or commands on a local or remote machine as part of the resource creation or destruction process. They can be used to bootstrap resources, configure servers, or run any other kind of initialization.

**Types of Provisioners**

- **File Provisioner:** Copies files or directories from the machine executing Terraform to the newly created resource.
  ```json
  provisioner "file" {
    source      = "path/to/local/file"
    destination = "/path/to/remote/destination"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/my-key.pem")
      host        = self.public_ip
    }
  }
  ```

- **Local-Exec Provisioner:** Executes a command on the machine running Terraform.
  ```json
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} >> ip_addresses.txt"
  }
  ```

- **Remote-Exec Provisioner:** Executes scripts or commands on the resource being created.
  ```json
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/my-key.pem")
      host        = self.public_ip
    }
  }
  ```

### [Modules](https://developer.hashicorp.com/terraform/language/modules)
In Terraform, modules are a way to organize and reuse your Terraform configurations. Modules allow you to encapsulate a set of resources and their configurations into a reusable and shareable unit. This makes your Terraform code more modular, maintainable, and scalable.

**Key Concepts**
- `Root Module:` The configuration in the main directory where you run terraform apply. It can include other modules but is not itself considered a module.
- `Child Modules:` Modules that are called or referenced from other modules. They can be defined in separate directories or included from external sources.
- `Module Source:` The location from where a module is retrieved. It can be a local path, a Git repository, a Terraform Registry, or other sources.

**Basic Structure** 

As an example create a directory for the module `my-network-module`.
- `my-network-module/`
  - `main.tf`
  - `variables.tf`
  - `outputs.tf`

**Benefits of Modules**
- Modularity
- Reusability
- Simplified Collaboration
- Versioning & Maintenances
- Abstraction
- Testing & Validation
- Scalability
- Security & Compliance
- Keep Modules DRY

### Secrets Management
In Terraform, secrets management is a crucial aspect, especially when dealing with sensitive information like API keys, passwords, or other confidential data. Here are some common approaches to managing secrets in Terraform:

1. **Environment Variables:**
You can store secrets in environment variables and reference them in your Terraform configuration. For example:
```json
variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
resource "aws_db_instance" "default" {
  ...
  password = var.db_password
  ...
}
```
Then, you can set the environment variables before running Terraform:
```bash
export TF_VAR_db_password="your_db_password"
```

2. **Terraform Variable Files**
You can use a separate variable file (`*.tfvars`) to store sensitive data and include this file in your `.gitignore` to prevent it from being checked into version control:
```bash
db_password = "your_db_password"
```
Then, apply the configuration with:
```bash
terraform apply -var-file="secrets.tfvars"
```

3. **Terraform Cloud/Enterprise**
Terraform Cloud and Enterprise offer secure ways to manage sensitive data. You can use the workspace variables to securely store and manage secrets.

4. **HashiCorp Vault**
HashiCorp Vault is a tool specifically designed for secrets management. You can integrate Terraform with Vault to dynamically retrieve secrets:
```json
provider "vault" {
  address = "https://vault.example.com"
}
data "vault_generic_secret" "example" {
  path = "secret/data/myapp/config"
}
resource "aws_db_instance" "default" {
  ...
  password = data.vault_generic_secret.example.data["password"]
  ...
}
```

5. **AWS Secrets Manager or Azure Key Vault**
You can use cloud-specific secret management services like AWS Secrets Manager or Azure Key Vault to store and retrieve secrets in your Terraform configurations.
AWS Key Vault
```json
data "aws_secretsmanager_secret" "example" {
  name = "my_secret"
}
data "aws_secretsmanager_secret_version" "example" {
  secret_id = data.aws_secretsmanager_secret.example.id
}
resource "aws_db_instance" "default" {
  ...
  password = jsondecode(data.aws_secretsmanager_secret_version.example.secret_string)["password"]
  ...
}
```
Azure Key Vault
```json
provider "azurerm" {
  features {}
}
data "azurerm_key_vault_secret" "example" {
  name         = "my-secret"
  key_vault_id = azurerm_key_vault.example.id
}
resource "azurerm_sql_server" "example" {
  ...
  administrator_login_password = data.azurerm_key_vault_secret.example.value
  ...
}
```

### [Vault](https://registry.terraform.io/providers/hashicorp/vault/latest/docs)
Integrating HashiCorp Vault with Terraform is a powerful way to manage secrets securely. Below are the steps to integrate Vault with Terraform and examples of how to use Vault to dynamically retrieve secrets for your infrastructure.

**Prerequisites**
1. **HashiCorp Vault:** Make sure you have a running instance of Vault.
2. **Vault Authentication:** Ensure you have authenticated access to Vault.
3. **Vault Provider:** Use the Vault provider in your Terraform configuration.

**Steps to Integrate Vault with Terraform**
1. **Configure Vault Provider**
First, you need to configure the Vault provider in your Terraform configuration.
```json
provider "vault" {
  address = "https://vault.example.com"
  token   = "s.xxxxxxx"  # Ideally, store this in an environment variable
}
```
2. **Retrieve Secrets from Vault**
You can use the `vault_generic_secret` data source to retrieve secrets from Vault.
```json
data "vault_generic_secret" "example" {
  path = "secret/data/myapp/config"
}
```
3. **Use Retrieved Secrets in Resources**
You can reference the retrieved secrets in your resources. For example, using a secret for an AWS RDS instance password:
```json
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = data.vault_generic_secret.example.data["password"]
  parameter_group_name = "default.mysql5.6"
}
```

**Complete Configuration**
Below is a complete example showing in `main.tf` the integration of Terraform with Vault to manage an AWS RDS instance password.
```json
provider "aws" {
  region = "us-west-2"
}
provider "vault" {
  address = "https://vault.example.com"
  token   = var.vault_token
}
variable "vault_token" {
  description = "Token to authenticate with Vault"
  type        = string
  sensitive   = true
}
data "vault_generic_secret" "db_password" {
  path = "secret/data/aws/rds"
}
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = data.vault_generic_secret.db_password.data["password"]
  parameter_group_name = "default.mysql5.6"
}
```
**Setting Environment Variables**
Before running `terraform apply`, you can set the Vault token as an environment variable to keep it secure.
```bash
export TF_VAR_vault_token="s.xxxxxxx"
```
**Advanced: Dynamic Secrets with Vault**
Vault can generate dynamic secrets, such as database credentials, on the fly. Here's an example of how to use dynamic secrets in Terraform. Enable Database Secrets Engine in Vault. First, enable the database secrets engine and configure it in Vault:
```bash
vault secrets enable database
vault write database/config/my-database \
    plugin_name=mysql-database-plugin \
    connection_url="{{username}}:{{password}}@tcp(127.0.0.1:3306)/" \
    allowed_roles="my-role" \
    username="admin" \
    password="admin"
vault write database/roles/my-role \
    db_name=my-database \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}'; GRANT SELECT ON *.* TO '{{name}}'@'%';" \
    default_ttl="1h" \
    max_ttl="24h"
```
**Use Dynamic Secrets in Terraform**
```json
provider "vault" {
  address = "https://vault.example.com"
  token   = var.vault_token
}
data "vault_database_credentials" "db_creds" {
  name = "my-role"
}
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = data.vault_database_credentials.db_creds.username
  password             = data.vault_database_credentials.db_creds.password
  parameter_group_name = "default.mysql5.6"
}
```

## Courtesy of Jakir

[![LinkedIn][linkedin-shield-jakir]][linkedin-url-jakir]
[![Facebook-Page][facebook-shield-jakir]][facebook-url-jakir]
[![Youtube][youtube-shield-jakir]][youtube-url-jakir]

### Have a good day, stay with me
<!-- Personal profile -->

[linkedin-shield-jakir]: https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white
[linkedin-url-jakir]: https://www.linkedin.com/in/jakir-ruet/
[facebook-shield-jakir]: https://img.shields.io/badge/Facebook-%231877F2.svg?style=for-the-badge&logo=Facebook&logoColor=white
[facebook-url-jakir]: https://www.facebook.com/jakir-ruet/
[youtube-shield-jakir]: https://img.shields.io/badge/YouTube-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white
[youtube-url-jakir]: https://www.youtube.com/@mjakaria-ruet/featured

<!-- Company profile -->

[linkedin-shield-lapissoft]: https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white
[linkedin-url-lapissoft]: https://www.linkedin.com/company/lapis-soft/
[facebook-shield-lapissoft]: https://img.shields.io/badge/Facebook-%231877F2.svg?style=for-the-badge&logo=Facebook&logoColor=white
[facebook-url-lapissoft]: https://www.facebook.com/GoLapisSoft/
[youtube-shield-lapissoft]: https://img.shields.io/badge/YouTube-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white
[youtube-url-lapissoft]: https://www.youtube.com/@LapisSoft/featured
