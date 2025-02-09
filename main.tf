terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
 
}

provider "aws" {
  region     = var.region_config
}


#Grupo de Seguridad
resource "aws_security_group" "web" {
  name        = "example_sg"
  description = "Permite Http"

  ingress {
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
}


resource "aws_instance" "example" {
  ami             = "ami-0d413c682033e11fd" #Canonical, Ubuntu, 22.04, amd64 jammy image
  #ami            = "ami-03d49b144f3ee2dc4" #Amazon Linux 2023 AMI 2023.6.2.
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web.name]
 
  tags = {
    name = "ExampleInstance"
  }

  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  install -y httpd
  systemctl enable httpd
  systemctl start httpd
  echo"<h1>Hola mundo desde $(hostname -f)</h1>">/var/www/html/index.html
  EOF 
}