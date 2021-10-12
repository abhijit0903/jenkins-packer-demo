pipeline {
  agent any
  
  tools {
    terraform 'terraform12'
    }

  stages {
    stage("Validate terraform plan") {
      steps {
        sh 'cd terraform'
        sh 'terraform init -input=false'
        sh 'terraform plan -input=false -out tfplan'
      }
    }
    stage('Approval to apply') {
            steps {
                input('Do you want to proceed?')
            }
        }
    stage("Run terraform for EC2 Instance") {
      steps {
        sh 'cd terraform'
        sh 'terraform apply -input=false tfplan'
      }
    }
  }
}  
