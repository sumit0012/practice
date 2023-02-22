resource "aws_s3_bucket" "b" {
  bucket = "sam199712056"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 40

  tags = {
    Name = "sumit-ebs"
  }
}


