# MinecraftWithAWS

Automated Minecraft server deployment on AWS using Terraform and Ansible.

## Overview

This project creates an AWS EC2 instance using Terraform and automatically configures a Minecraft Java Edition server using Ansible.

## Technologies

- AWS EC2
- Terraform
- Ansible
- Ubuntu Server
- Java
- Minecraft Java Edition

## Deployment

1. Run Terraform to provision the EC2 instance.
2. Generate the Ansible inventory file.
3. Run the Ansible playbook.
4. Connect to the Minecraft server using the EC2 public IP.

## Verification

The server can be verified using:

```bash
nmap <server-ip>
