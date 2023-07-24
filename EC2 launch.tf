provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  ami = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  key_name = "terraform key"
  security_groups =  ["Security"]
}

resource "aws_security_group" "Security" {
  name        = "Security"
  description = "SSH testing"


  ingress {
    description = "TSSH"
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

  tags = {
    Name = "allow_tls"
  }
}

