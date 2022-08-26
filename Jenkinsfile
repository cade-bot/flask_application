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
           sh ' docker login -u $USERNAME --password $PASSWORD'
         }
       }
     }
  }

     stage('Build Flask App and push it to dockerhub repo') {
       steps {
         script {
           sh 'docker build . -t $registry_flask_app'
           sh 'docker push $registry_flask_app'
          }
       }
    }

     stage('Pulling SQL Server Container from DockerHub') {
       steps {
         script {
           sh 'docker pull $registry_sql_server'
          }
       }
    }

     stage('Deploying Containers via Docker Swarm') {
       steps {
         script {
           sh 'docker swarm init'
           sh 'docker stack deploy --compose-file $compose_file flask_application'
          }
       }
    }



  }
}