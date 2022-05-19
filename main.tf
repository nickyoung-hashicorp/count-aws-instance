terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=3.42.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "server" {
  count = var.count

  ami           = data.aws_ami.ubuntu.id # found in data.tf
  instance_type = var.instance_type # found in variables.tf
  associate_public_ip_address = true

  tags = {
    Name = "${var.team}-web-server-${count.index}"
  }
}
