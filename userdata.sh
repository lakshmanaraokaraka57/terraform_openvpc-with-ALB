#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello Lakshman welcom to Terraform: $(hostname -i)</h1 "> /var/www/html/index.html
