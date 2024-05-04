pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/thulasiraman9468/ec2-flask-app.git'
            }
        }
         stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
         stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }
         stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
    }
}
