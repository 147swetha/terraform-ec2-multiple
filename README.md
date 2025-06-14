# Terraform + Ansible CI/CD Automation with Jenkins

This project demonstrates an end-to-end infrastructure and configuration automation workflow using:

- **Terraform**: To provision AWS EC2 instances.
- **Ansible**: To configure the instances (e.g., install Apache).
- **Jenkins**: To automate the CI/CD pipeline.
- **GitHub**: As the source code repository.

---

## 🔧 Tools Used

- **Terraform**: Infrastructure as Code
- **Ansible**: Configuration Management
- **Jenkins**: CI/CD Automation
- **AWS**: Cloud Infrastructure (EC2)
- **GitHub**: Code Repository

---

## 📂 Repository Structure

terraform-ec2-multiple/
│
├── .github/workflows/ # (Optional for GitHub Actions - not used in Jenkins pipeline)
├── ansible/
│ ├── apache-playbook.yml # Installs & configures Apache on target EC2s
│ └── generate_inventory.sh # Generates Ansible inventory from Terraform output
│
├── main.tf # Terraform configuration to create EC2 instances
├── variables.tf # Input variables for Terraform
├── outputs.tf # Outputs like instance public IPs
├── Jenkinsfile # Jenkins Pipeline script
└── README.md # Project overview


---

## 🔄 Automation Flow (CI/CD)

1. **Trigger Jenkins Job**:
   - Jenkins pulls the latest code from GitHub.
   - Starts the pipeline defined in `Jenkinsfile`.

2. **Terraform Stages**:
   - `terraform init` initializes the Terraform project.
   - `terraform apply -auto-approve` provisions EC2 instances.

3. **Ansible Inventory**:
   - A shell script generates an Ansible inventory using Terraform output.

4. **Ansible Stage**:
   - Jenkins uses `ssh-agent` with your SSH key to connect.
   - Runs `ansible-playbook` to install Apache on the EC2 instances.

5. **Result**:
   - Apache is installed and running.
   - You can access the web server using the public IPs from Terraform.

---

## ✅ How to Run

1. Commit changes to GitHub.
2. Trigger the Jenkins pipeline.
3. Wait for all stages to complete.
4. Get the public IPs from Terraform output or AWS Console.
5. Access Apache on: `http://<public-ip>` from your browser.

---

## 🧠 What We Have Automated

- ✅ Infrastructure provisioning using Terraform (multi-instance EC2 setup)
- ✅ Configuration automation using Ansible (Apache install)
- ✅ Jenkins pipeline with multi-stage CI/CD
- ✅ GitHub integrated source control
- ✅ Dynamic inventory generation for Ansible
- ✅ Credentials & key handling securely via Jenkins
  
---

## 📌 Important Notes

- **Public IPs change** each time EC2 instances are destroyed & recreated. Update the inventory or consider using Elastic IPs.
- Jenkins requires AWS credentials for Terraform to work. These were set up via Jenkins > Manage Credentials.
- SSH Key (`ansible-key.pem`) must match the one used in your Terraform EC2 provisioning.

---

![WhatsApp Image 2025-06-14 at 16 35 54_7cd1b6f9](https://github.com/user-attachments/assets/06d75116-3fda-46ac-a50d-6c42350eafc1)

![WhatsApp Image 2025-06-14 at 16 35 54_c810a64a](https://github.com/user-attachments/assets/f3d08cbf-af7c-40e9-9d0f-8fa17f7018cc)









