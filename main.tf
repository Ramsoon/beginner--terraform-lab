############################################
# Security Group
############################################

resource "aws_security_group" "web_sg" {
  name        = "${var.instance_name}-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_ip]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

############################################
# EC2 Instance
############################################

resource "aws_instance" "web_server" {

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = var.instance_name
  }
}