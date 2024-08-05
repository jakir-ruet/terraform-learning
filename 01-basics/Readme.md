#### Introduction
Terraform, an open source “Infrastructure as Code” tool created by HashiCorp, allows programmers to build, change and version infrastructure safely and efficiently. Users define and provide data center infrastructure using a Declarative Configuration Language (DCL) known as HashiCorp Configuration Language (HCL), or optionally JSON. Terraform's extensible plugin-based architecture supports a wide range of providers, enabling seamless integration and management of diverse infrastructure environments.

Terraform is an infrastructure as code (IaC) tool that lets you build, change, and version `cloud` and `on-prem` resources safely and efficiently. Its can manage low-level components like `compute`, `storage`, and `networking resources`, as well as high-level components like DNS entries and SaaS features. Steps of Install & Configuration Environment.
- [Install Terraform CLI]((https://developer.hashicorp.com/terraform/install))
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
- [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- Install VS Code Editor
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
- Install HashiCorp Terraform plugin for VS Code

**[About the Terraform Language](https://developer.hashicorp.com/terraform/language)**
```json
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}
```
For Example
```json
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}
```
Here we discuss
- Syntax > See Main `README.md`
- Variables > See Main `README.md`
- Top Level Blocks > See Main `README.md`

👍👍👍 Done 👍👍👍