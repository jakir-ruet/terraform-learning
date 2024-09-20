#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo echo '<h1>Welcome to my application</h1>' | sudo tee /var/www/html/index.html
sudo mkdir -p /var/www/html/myapp
sudo echo '<!DOCTYPE html>
<html>
<head>
    <title>Welcome to my application</title>
</head>
<body style="background-color: white;">
    <h1>Welcome to my application</h1>
    <p>This is a simple demo application use for testing purpose</p>
    <p>Application version: V1.0</p>
</body>
</html>' | sudo tee /var/www/html/myapp/index.html

# Retrieve instance metadata if running on AWS EC2
if [ -f /sys/hypervisor/uuid ] && grep -q ec2 /sys/hypervisor/uuid; then
    TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
    sudo curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/myapp/metadata.html
fi