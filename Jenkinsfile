pipeline {
  agent any
  
  tools {
    terraform 'terraform12'
    }

  stages {
    stage("Validate packer template") {
      steps {
        sh '/usr/local/bin/packer validate packer/imageBuilder.json'
      }
    }
    stage("Create AWS AMI") {
      steps {
        sh 'echo "/usr/local/bin/validate packer/imageBuilder.json"'
      }
    }    
    stage("Validate terraform plan") {
      steps {
        sh 'echo "terraform init -input=false"'
        sh 'echo "terraform plan -input=false -out tfplan --var-file terraform/env-vars/terraform.tfvars"'
      }
    }
    stage('Approval to apply') {
            steps {
                input('Do you want to proceed?')
            }
        }
    stage("Run terraform for EC2 Instance") {
      steps {
        sh 'echo "terraform apply -input=false tfplan"'
      }
    }
  }
}  
