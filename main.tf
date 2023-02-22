provider "aws" {
region = "us-east-1"
access_key = "AKIAZD3X7HF7QYWXIQGW"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-0dfcb1ef8550277af"
instance_type = "t2.medium"
  key_name        = "terraproject"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "us-east-1a"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my swiggy application created by terraform infrastructurte by raham sir server-1" > /var/www/html/index.html
EOF
tags = {
Name = "zepto-01"
}
}

resource "aws_instance" "two" {
ami = "ami-0dfcb1ef8550277af"
instance_type = "t2.medium"
  key_name        = "terraproject"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "us-east-1b"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my swiggy application created by terraform infrastructurte by raham sir server-2" > /var/www/html/index.html
EOF
tags = {
Name = "zepto-02"
}
}


