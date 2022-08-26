pipeline {
    environment {
        registry_flask_app = "cade360/flask_app"
		registry_sql_server = "cade360/sql_server"
		dockerhub = credentials('dockerhub_id')
		compose_file = "docker-compose.yml"
    }

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
           sh 'ls'
          }
       }
    }

      stage('Login Dockerhub') {
       steps {
         script {
           withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
           sh ' docker login -u $USERNAME --password-stdin $PASSWORD'
           }
//            sh 'echo $dockerhub_id_PSW | docker login -u $dockerhub_id_USR --password-stdin'
          }
       }
    }
  }
}