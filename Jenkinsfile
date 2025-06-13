pipeline {
    agent any

    environment {
        TF_DIR = '.'  // Your Terraform files are at the repo root
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/<your-username>/terraform-ec2-multiple.git'  // Replace with your GitHub URL
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${env.TF_DIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${env.TF_DIR}") {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Generate Ansible Inventory') {
            steps {
                sh 'chmod +x ansible/generate_inventory.sh && ansible/generate_inventory.sh > ansible/inventory.ini'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sshagent(['ansible-ssh-key']) {
                    sh 'ansible-playbook -i ansible/inventory.ini ansible/apache-playbook.yml'
                }
            }
        }
    }
}
