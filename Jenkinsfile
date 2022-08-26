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

//      stage('Deploying Containers via Docker Swarm') {
//        steps {
//          script {
//            try {
//               sh 'docker swarm init'
//            } catch (Exception e) {
//               echo 'Exception occurred: ' + e.toString()
//               sh 'docker swarm leave --force'
//       }
//     }
//   }

     stage('Deploying Containers via Docker Swarm') {
       steps {
         script {
           sh 'docker stack deploy --compose-file $compose_file flask_application'
           sh 'sleep 10'
           sh 'docker ps'
          }
       }
    }

     stage('Set env for SQL_Server') {
       steps {
         script {
           env.sql_server = sh (
               script: 'docker ps --quiet --filter name=flask_application_sql',
               returnStdout: true
            )
        }
         echo "SQL Server Container ID: ${env.sql_server}"
    }
}

     stage('Initialising Database Schema') {
       steps {
         script {
           sh "docker exec -it \ "${sql_server}"\ bash "
           sh 'mysql --user=root --password=password'
           sh 'create database fmadata'
           sh 'exit'
           sh 'mysql -u root -p fmadata < schema2.sql'
           sh 'exit'
          }
       }
    }


     stage('Checking Containers are deployed via Docker Swarm') {
       steps {
         script {
           sh 'docker ps'
          }
       }
    }


  }
}