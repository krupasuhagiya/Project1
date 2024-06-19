pipeline {
    agent any

    environment {
        MY_CRED = credentials('admin')
    }

    stages {
        stage('Git checkout') {
            steps {
                git 'https://github.com/krupasuhagiya/Terraform_JK.git'
            }
        }

        stage('azurelogin') {
            steps {
                bat '''
                    az login --service-principal -u %MY_CRED_CLIENT_ID% -p %MY_CRED_CLIENT_SECRET% -t %MY_CRED_TENANT_ID%
                '''
            }
        }

        stage('Terraform Init') {

            steps {
                bat '''
                    echo "Initialising Terraform"
                    terraform init
                '''
            }
        }
    
        stage('Terraform Validate') {
            steps {
                bat '''
                    echo "Validating Terraform Code"
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([azureServicePrincipal(
                    credentialsId: 'admin',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                    bat '''
                        echo "Planning Terraform"
                        terraform plan
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([azureServicePrincipal(
                    credentialsId: 'admin',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                    bat '''
                        echo "Applying Terraform"
                        terraform apply -lock=false -auto-approve
                    '''
                }
            }
        }
    }

    post {
        failure {
            echo "Jenkins Build Failed"
        }

        success {
            echo "Jenkins Build Success"
        }

        always {
            cleanWs()
        }
    }
}
