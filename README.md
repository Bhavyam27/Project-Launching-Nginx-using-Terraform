# Terraform Automated Nginx Deployment on AWS EC2

## Project Overview
This project demonstrates how to **automate the deployment of an Nginx web server** on an AWS EC2 instance using **Terraform**.  
The infrastructure is dynamic using **variables**, and outputs provide the **EC2 public IP and DNS** for easy access.

---

## Features
- Launch an EC2 instance in the **default VPC**
- Create a **Security Group** with HTTP (80) and SSH (22) access
- Install and configure **Nginx** automatically using `user_data`
- Serve a custom webpage (`World of Terraform`)
- Use Terraform **variables** for AMI ID, instance type, and root volume
- Display outputs for **EC2 public IP and DNS**

---

## Prerequisites
- Terraform installed (v1.x recommended)
- AWS CLI configured with proper credentials
- AWS key pair (`my_key`) in your desired region
- Ubuntu-based AMI (for example, Amazon Linux 2 or Ubuntu 22.04)

---

## Project Structure

```text
.
├── ec2.tf           # Main Terraform configuration (VPC, Security Group, EC2)
├── variables.tf     # Variable definitions
├── outputs.tf       # Output definitions for Public IP and DNS
├── nginx.sh         # Script to install and start Nginx
└── README.md        # Project documentation
