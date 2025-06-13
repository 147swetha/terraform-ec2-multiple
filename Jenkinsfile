pipeline {
    agent any
    environment {
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }
    stages {
        stage('Terraform Init & Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Generate Inventory') {
            steps {
                dir('ansible') {
                    sh 'chmod +x generate_inventory.sh'
                    sh './generate_inventory.sh'
                }
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                dir('ansible') {
                    sshagent(['ansible-ssh-key']) {
                        sh 'ansible-playbook -i inventory.ini apache-playbook.yml'
                    }
                }
            }
        }
    }
}
