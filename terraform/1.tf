provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu_web" {
  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  key_name               = "miku-virginia-key"
  vpc_security_group_ids = [aws_security_group.My_webserver.id]

  tags = {
    Name = "My_ubuntu_server"
  }
}

resource "aws_security_group" "My_webserver" {
  name        = "WebServer Security Group"
  description = "My SecutiryGroup"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
