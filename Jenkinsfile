pipeline {
   agent any
   stages {
    stage('Checkout') {
      steps {
        script {
           git credentialsId: 'github', url: 'https://github.com/cade-bot/flask_application.git'
           sh 'cd .flask_application'
           sh 'ls'
          }
       }
    }

//      stage('Pull Docker Images from ') {
//       steps {
//         script {
//            git credentialsId: 'github', url: 'https://github.com/cade-bot/flask_application.git'
//           }
//        }
//     }


  }
}