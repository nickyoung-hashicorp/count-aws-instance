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

resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    name = "${var.team}-vpc-${var.region}"
  }
}

resource "aws_instance" "server" {
  count = var.scale

  ami           = data.aws_ami.ubuntu.id # found in data.tf
  instance_type = var.instance_type # found in variables.tf
  associate_public_ip_address = true

  tags = {
    Name = "${var.team}-web-server-${count.index}"
  }
}
