terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA6CAPKJYAXZKNO3DK"
  secret_key = "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"
}

terraform {
  cloud {
    organization = "kartik-terraform-start"

    workspaces {
      name = "department-of-mysteries"
    }
  }
}

variable "inst_type" {
  type =   string
  default = "t3.micro"
}

variable "ami" {
  type = string
  default = "ami-024fc608af8f886bc"
}

resource "aws_instance" "my-first-tf-node-1" {
  ami           = var.ami
  instance_type = var.inst_type
  tags = {
    Name = "my-first-tf-node-1"
  }
}


output "ec2_public_ip" {
  value = aws_instance.my-first-tf-node-1.public_ip

}

