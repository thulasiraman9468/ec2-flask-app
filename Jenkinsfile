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
        stage('Terraform Apply') {
            steps {
                
                def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])    
                // sh 'terraform apply'
            }
        }
    }
}
