pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                dir('ansible/../') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Generate Inventory') {
            steps {
                dir('ansible') {
                    sh 'bash generate_inventory.sh'
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                dir('ansible') {
                    sshagent(credentials: ['83bd23bf-000b-423a-904d-ea16cbe53fae']) {
                        sh 'ansible-playbook -i inventory.ini apache-playbook.yml'
                    }
                }
            }
        }
    }
}
