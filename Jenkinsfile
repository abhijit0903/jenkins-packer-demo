pipeline {
  agent any

  parameters {
      booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after plan')
  }

  tools {
    terraform 'terraform12'
    }

  stages {
    stage("Validate packer template") {
      steps {
        sh 'echo "/usr/local/bin/packer validate imageBuilder.json"'
      }
    }
    stage("Create packer template") {
      steps {
        sh 'echo "/usr/local/bin/validate packer/imageBuilder.json"'
      }
    }    
    stage("Validate terraform plan up EC2 Instance") {
      steps {
        sh 'echo "terraform init -input=false"'
        sh 'echo "terraform plan -input=false -out tfplan --var-file terraform/env-vars/terraform.tfvars"'
      }
    }
    stage("Run terraform for EC2 Instance") {
      steps {
        sh 'echo "terraform apply -input=false tfplan"'
      }
    }
  }
}  
