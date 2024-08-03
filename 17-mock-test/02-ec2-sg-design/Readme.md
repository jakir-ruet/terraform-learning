#### Design EC2 Instance & Security Group
##### Sept-01: Create Private Key in `private-key.pem` file & `app-one.sh`
```bash
openssl genpkey -algorithm RSA -out private_key.pem -aes256
openssl genpkey -algorithm RSA -out private-key.pem
openssl genpkey -algorithm RSA -out private-key.pem -aes256 -pkeyopt rsa_keygen_bits:2048 # size declare [Optional]
```
