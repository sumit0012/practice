provider "aws" {
region = "us-east-1"
access_key = ""
secret_key = ""
}

resource "aws_instance" "one" {
ami = "ami-0dfcb1ef8550277af"
instance_type = "t2.micro"
  key_name        = "terraproject"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "us-east-1a"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "Hiii all this is my Zepto application created by terraform infrastructurte by SUMIT server-1" > /var/www/html/index.html
EOF
tags = {
Name = "zepto-01"
}
}

resource "aws_instance" "two" {
ami = "ami-0dfcb1ef8550277af"
instance_type = "t2.micro"
  key_name        = "terraproject"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "us-east-1b"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "Hiii all this is my Zepto application created by terraform infrastructurte by Sumit server-2" > /var/www/html/index.html
EOF
tags = {
Name = "zepto-02"
}
}


