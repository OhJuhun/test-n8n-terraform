terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2" # Placeholder region
}

# Resource for KAN-2: ec2 instance (4 vCPU / 16 GiB)
resource "aws_instance" "ec2_kan2" {
  ami                    = var.ami
  instance_type         = "m7g.xlarge"
  subnet_id             = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name              = var.key_name
}

variable "ami" {
  description = "The AMI ID for the instance."
  type        = string
}

variable "subnet_id" {
  description = "The Subnet ID where the instance should be launched."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of Security Group IDs to associate with the instance."
  type        = list(string)
}

variable "key_name" {
  description = "The SSH Key Pair Name."
  type        = string
}