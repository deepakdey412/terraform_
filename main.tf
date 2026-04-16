provider "aws" { region = "ap-south-1" }

# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = file("mykeypair.pub")
# }

# default AWS VPC
resource "aws_default_vpc" "default" {}

# resource "aws_security_group" "my_security_group" {
#   name        = "my-sg"
#   description = "Security group for Terraform practice"
#   vpc_id      = aws_default_vpc.default.id

#   ingress {
#     from_port   = 22            # SSH port
#     to_port     = 22            # SSH port
#     protocol    = "tcp"         # TCP protocol
#     cidr_blocks = ["0.0.0.0/0"] # allow SSH from anywhere
#   }

#   egress {
#     from_port   = 0             # all ports
#     to_port     = 0             # all ports
#     protocol    = "-1"          # all protocols
#     cidr_blocks = ["0.0.0.0/0"] # allow all outbound traffic
#   }

#   tags = {
#     Name = "ssh-only-sg" # tag name
#   }
# }

resource "aws_instance" "my_instance" {
  ami           = "ami-05d2d839d4f73aafb" # Ubuntu AMI
  instance_type = var.ec2_instance_type   # instance type
  # key_name               = aws_key_pair.deployer.key_name            # SSH key
  # vpc_security_group_ids = [aws_security_group.my_security_group.id] # security group

  root_block_device {
    volume_size = var.root_block_device_volume_size
    volume_type = "gp3" # SSD type
  }

  tags = {
    Name = "Terraform-EC2-cicd"
  }
}
