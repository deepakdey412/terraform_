variable "region" {
  default = "ap-south-1"
}

variable "ec2_instance_type" {
  description = "The type of EC2 instance to use"
  type        = string
  default     = "t3.micro"
}

variable "root_block_device_volume_size" {
  description = "The size of the root block device in GB"
  type        = number
  default     = 18
}

variable "key_name" {
  description = "Existing AWS Key Pair"
  default     = "deployer-key"
}

variable "security_group_id" {
  description = "Existing Security Group ID"
  default     = "sg-0a9ffbff75e8b7f7e"
}
