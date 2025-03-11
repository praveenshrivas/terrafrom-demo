terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

resource "aws_s3_bucket" "s3_demo" {
  bucket = "praveen-s3-bucket-110325"
}

resource "aws_instance" "ec2_demo" {
  count         = 2
  ami           = "ami-1234567890"
  instance_type = var.instance_type  
  depends_on    = [aws_s3_bucket.s3_demo]
}

output "public_ips" {
  value = aws_instance.ec2_demo[*].public_ip  
}

output "s3_bucket_name" {
  value = aws_s3_bucket.s3_demo.bucket  
}


"""
In this template we have mentioned how to use required_versions, count and depends_on attribute 
along with the day one concepts.

"""
