# terraform-ec2-multiple

This repository contains Terraform code to automatically provision multiple EC2 instances in AWS using GitHub Actions for CI/CD. Changes pushed to this repo will trigger Terraform workflows that plan and apply infrastructure changes.


PROJECT STRUCTURE:

terraform-ec2-multiple/
│
├── main.tf              # Main configuration file
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── terraform.tfvars     # Values for variables
├── provider.tf          # AWS provider configuration
└── .github/
    └── workflows/
        └── terraform.yml   # GitHub Actions workflow file

Outcome:

Infrastructure as Code (IaC) using Terraform
Automated provisioning through GitHub Actions
Secure credential handling with GitHub Secrets
Full DevOps workflow from GitHub to AWS

![WhatsApp Image 2025-06-10 at 13 32 31_49630347](https://github.com/user-attachments/assets/10c271a0-cde7-47d4-be0b-5e25d0790a50)
