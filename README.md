# MinecraftWithAWS

Automated deployment of a Minecraft Java Edition server on AWS using Terraform and Ansible.

## Project Overview

This project provisions an AWS EC2 instance using Terraform and automatically configures a Minecraft server using Ansible. The goal is to create a fully automated deployment process that minimizes manual configuration and allows a Minecraft server to be deployed consistently and quickly.

## Technologies Used

- AWS EC2
- Terraform
- Ansible
- Ubuntu Server
- Java
- Minecraft Java Edition

## Architecture

1. Terraform creates the AWS infrastructure.
2. Terraform provisions an Ubuntu EC2 instance.
3. Terraform generates the required outputs for Ansible.
4. Ansible connects to the EC2 instance.
5. Ansible installs Java.
6. Ansible creates the Minecraft service account.
7. Ansible downloads the Minecraft server.
8. Ansible accepts the Minecraft EULA.
9. Ansible creates and enables a systemd service.
10. The Minecraft server starts automatically.

## Repository Structure

```
minecraft-aws-automation/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── ansible/
│   ├── inventory.ini
│   └── minecraft.yml
│
└── README.md
```

## Deployment Process

### Step 1: Initialize Terraform

```bash
terraform init
```

### Step 2: Deploy AWS Resources

```bash
terraform apply
```

Review the execution plan and enter:

```bash
yes
```

Terraform will create the EC2 instance and output the public IP address.

### Step 3: Verify Connectivity

```bash
ansible all -i inventory.ini -m ping
```

Expected result:

```text
SUCCESS => {
    "ping": "pong"
}
```

### Step 4: Configure the Minecraft Server

```bash
ansible-playbook -i inventory.ini minecraft.yml
```

Ansible will:

- Update packages
- Install Java
- Create the minecraft user
- Create the Minecraft directory
- Download the Minecraft server
- Accept the EULA
- Create the Minecraft systemd service
- Enable and start the service

## Verification

Verify the Minecraft server is listening on port 25565:

```bash
nmap <public-ip>
```

Expected result:

```text
25565/tcp open
```

Launch Minecraft Java Edition and connect using the server's public IP address.

## Features

- Infrastructure as Code with Terraform
- Automated configuration with Ansible
- Automatic Minecraft server installation
- Automatic EULA acceptance
- Automatic service startup using systemd
- Reproducible deployment process

## Security Considerations

The repository excludes:

- Private SSH keys
- Terraform state files
- Terraform provider binaries
- Sensitive configuration files

Only the public SSH key is stored in the repository.

## Cleanup

To remove all AWS resources:

```bash
terraform destroy
```

Review the execution plan and enter:

```bash
yes
```

Terraform will remove all resources created for the project.


# Resources and References

The following resources were used during research, development, troubleshooting, and implementation of this project:

## AWS Documentation

Amazon Web Services. "Setting Up a Minecraft Java Server on Amazon EC2."

https://aws.amazon.com/blogs/gametech/setting-up-a-minecraft-java-server-on-amazon-ec2/

This guide was used as a reference for AWS infrastructure setup, Minecraft server deployment concepts, and EC2 configuration.

## Community Tutorials

AWS Heroes. "Minecraft Server on AWS."

https://dev.to/aws-heroes/minecraft-server-on-aws-5g61

This article provided additional insight into deploying Minecraft servers on AWS and general infrastructure considerations.

Minecraft Forum. "Amazon EC2 Server Setup Guide."

https://www.minecraftforum.net/forums/support/server-support-and/1900051-amazon-ec2-server-setup-guide

This guide was referenced for Minecraft server configuration and EC2 deployment best practices.

## Official Documentation

Terraform Documentation

https://developer.hashicorp.com/terraform/docs

Used for Terraform syntax, AWS provider configuration, variables, outputs, and infrastructure provisioning.

Ansible Documentation

https://docs.ansible.com/

Used for playbook development, inventory configuration, modules, and automation tasks.

AWS EC2 Documentation

https://docs.aws.amazon.com/ec2/

Used for EC2 instance management, networking, security groups, and SSH access.

AWS CLI Documentation

https://docs.aws.amazon.com/cli/

Used for AWS credential configuration and command-line interaction with AWS resources.

Minecraft Server Documentation

https://www.minecraft.net/en-us/download/server

Used for Minecraft Java Edition server software and deployment requirements.
