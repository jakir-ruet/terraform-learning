In Terraform, secrets management is a crucial aspect, especially when dealing with sensitive information like API keys, passwords, or other confidential data. Here are some common approaches to managing secrets in Terraform:
1. Environment Variables
2. Terraform Variable Files
3. Terraform Cloud/Enterprise
4. HashiCorp Vault
5. AWS Secrets Manager or Azure Key Vault

#### Vault [Install](https://developer.hashicorp.com/vault/install) & Integration
Create EC2 Instance from AWS Console & Install vault on there.

Install gpg
```bash
sudo apt update
sudo apt install gpg
```
Signing key download
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```
Verify keys fingerprint
```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```
Install
```bash
sudo apt update
sudo apt install vault
```