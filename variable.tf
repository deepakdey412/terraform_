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
