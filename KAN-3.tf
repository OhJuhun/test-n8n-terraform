resource "aws_instance" "ec2_kan_3" {
  ami                    = var.ami
  instance_type          = "m7g.xlarge"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name

  tags = {
    Name    = "Kan-3-EC2-Instance"
    Project = "KAN-3"
  }
}

variable "ami" {
  description = "The AMI ID for the instance."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the instance will be launched."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with the instance."
  type        = list(string)
}

variable "key_name" {
  description = "The key pair name for SSH access."
  type        = string
}