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
sudo apt-get update
sudo apt-get install gpg
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
sudo apt-get update
sudo apt-get install vault
```
Enable, start and check the Vault Services.
```bash
systemctl daemon-reload
systemctl start vault
systemctl enable vault
systemctl status vault
```
Check & try to login
```bash
vault vault
vault login
```
Start the vault server as a dev server, we may run it as another server.
```bash
vault server -dev -dev-listen-address="0.0.0.0:8200"
```
Export from another terminal (Paste & Enter)
```bash
export VAULT_ADDR='http://0.0.0.0:8200' # 
```
Update EC2 Instance's inbound configuration & try to access from browser.
```bash
http://public_ip_ec2_instance:8520/
```
Making policies as your requirement and execute vault server terminal.
```bash
vault policy write terraform - <<EOF
path "*" {
  capabilities = ["list", "read"]
}
path "secrets/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "kv/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "secret/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "auth/token/create" {
capabilities = ["create", "read", "update", "list"]
}
EOF
```
Create the AppRole
```bash
vault write auth/approle/role/terraform \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40 \
    token_policies=terraform
```
AWS needs `Access Key ID` and `Access Secret Key ID`

Generate Role ID - we can retrieve the Role ID using the Vault CLI
```bash
vault read auth/approle/role/my-approle/role-id
vault read auth/approle/role/terraform/role-id
```
Generate Secret ID - To generate a Secret ID
```bash
vault write -f auth/approle/role/my-approle/secret-id
vault write -f auth/approle/role/terraform/secret-id
```