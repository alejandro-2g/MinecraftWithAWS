terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "minecraft_key" {
  key_name   = "minecraft-terraform-key"
  public_key = file("${path.module}/minecraft-key.pub")
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft-terraform-sg"
  description = "Allow SSH and Minecraft traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Minecraft"
    from_port   = 25565
    to_port     = 25565
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
    Name = "minecraft-terraform-sg"
  }
}

resource "aws_instance" "minecraft" {
  ami                    = "ami-05cf1e9f73fbad2e2"
  instance_type          = "t3.medium"
  key_name               = aws_key_pair.minecraft_key.key_name
  vpc_security_group_ids = [aws_security_group.minecraft_sg.id]

  tags = {
    Name = "TerraformMinecraftServer"
  }
}