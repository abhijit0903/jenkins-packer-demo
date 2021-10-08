pipeline {
  agent any
  tools {
    terraform 'terraform12'
    }
  stages {
    stage("packer") {
      steps {
        sh 'packer --version'
      }
    }
    stage("terraform") {
      steps {
        sh 'terraform --version'
      }
    }
  }
}  
