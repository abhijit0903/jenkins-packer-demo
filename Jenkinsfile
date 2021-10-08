pipeline {
  agent any
  tools {
    terraform 'terraform12'
    }
  stages {
    stage("git") {
      steps {
        sh 'terraform --version'
      }
    }
  }
}  
