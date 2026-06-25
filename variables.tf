variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 Instance Name"
  type        = string
}

variable "key_name" {
  description = "Existing AWS Key Pair Name"
  type        = string
}

variable "allowed_ssh_ip" {
  description = "IP allowed to SSH"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
}