provider "aws" {
  region = var.region
}

# Existing Key Pair
data "aws_key_pair" "existing_key" {
  key_name = var.key_name
}

# Existing Security Group
data "aws_security_group" "existing_sg" {
  id = var.security_group_id
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami           = "ami-05d2d839d4f73aafb"
  instance_type = var.ec2_instance_type

  key_name = data.aws_key_pair.existing_key.key_name

  vpc_security_group_ids = [
    data.aws_security_group.existing_sg.id
  ]

  root_block_device {
    volume_size = var.root_block_device_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "Terraform-EC2-cicd"
  }
}
