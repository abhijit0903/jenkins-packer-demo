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
        sh '/usr/local/bin/packer build packer/imageBuilder.json'
      }
    }    
    stage("Validate terraform plan") {
      steps {
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
        sh 'terraform apply -input=false tfplan'
      }
    }
  }
}  
