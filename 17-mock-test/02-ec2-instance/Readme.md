### Design EC2 Instance & Security Group
#### Sept-01: Pre-Requisite
- Create Private Key in `private-key.pem` file
```bash
openssl genpkey -algorithm RSA -out private-key.pem -aes256
openssl genpkey -algorithm RSA -out private-key.pem
openssl genpkey -algorithm RSA -out private-key.pem -aes256 -pkeyopt rsa_keygen_bits:2048 # size declare [Optional]
```
- Create `local-exec-output-files` named directory where `local-exec` provisioner creates a file (creation-time provisioner)

##### Roadmap
- Design a Virtual Private Cloud (VPC)
- Design a Security Group (SG)
- Design a Elastic Compute Cloud (EC2) 
  - A EC2 Instance (Public) for Bastion > SSH Port 22 Enable
  - A EC2 Instance (Private) > SSH Port 22 & 80 Enable 
  - A EC2 Instance (Private) > SSH Port 22 & 80 Enable  
- Configure Elastic IP (EIP)
- Null Provisioner
  - Use Remote Exec Provisioner
  - Use Local Exec Provisioner
  - Use Depends_on Meta Argument

##### Execution, Validate, Plan, Apply & Destroy
```bash
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform destroy
```

##### Test & Verify
```bash
ssh -i private-key/private-key.pem ubuntu@PublicIPBastionHost
ssh -i private-key/private-key.pem ubuntu@18.225.27.67
curl http://Private-Instance-01-Private-Ip 
curl http://Private-Instance-02-Private-Ip
ssh -i /tmp/private-key.pem ubuntu@Private-Instance-01-Private-Ip
```