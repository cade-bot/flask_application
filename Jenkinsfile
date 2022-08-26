pipeline {
   agent any
   stages {
    stage('Checkout') {
      steps {
        script {
           git credentialsId: 'github', url: 'https://github.com/cade-bot/flask_application.git'
          }
       }
    }

     stage('Check Folder is there') {
      steps {
        script {
           sh 'cd .flask_application'
           sh 'ls'
          }
       }
    }


  }
}