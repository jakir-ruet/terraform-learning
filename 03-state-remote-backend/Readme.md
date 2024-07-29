**Limitation of Statefile**
- Other DevOps Engineers/Developers can view sensitive data such as passwords, token keys etc.
- Suppose a DevOps Engineer updates the `Statefile` and push to GitHub without using `terraform apply`. In that case, nothing updates the resource on the cloud rather than creating conflict due state not being updated.

**Overcome**
To address and overcome the disadvantages of using a state file in Terraform, particularly when stored in a remote backend like Amazon S3, consider implementing the following best practices and strategies:
1. Making Amazon S3 and using Remote Backend for storing `State File` due it will update automatically. There is no chance of conflict. 
2. State Locking: When using S3 as a backend, pair it with a state locking mechanism like DynamoDB. This prevents concurrent modifications and ensures that only one process can modify the state file at a time.

```bash
terraform --version
# go to respective file directory
terraform show
terraform init
terraform plan
terraform show
terraform apply # making state
```