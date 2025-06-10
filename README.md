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
