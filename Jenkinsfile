pipeline {
    environment {
        registry_flask_app = "cade360/flask_app"
		registry_sql_server = "cade360/sql_server"
		registryCredentials = “cade360”
		compose_file = "./flask_application/docker-compose.yml"
		docker_image = “”
		HOME = “./flask_application”
    }

agent any {
		stages {
		    stage ('Build docker image of Flask Application'){
			    script {
			    	docker_image = docker.build(registry_flask_app)

				}
			}
		}

	    	stage ('Build docker image of SQL Server' ){
		    	script {
			    	docker_image = docker.build(registry_sql_server)
				}
			}
		}

		    stage  ('Push image of SQL Server' )
		    	script {
			    	docker.withRegistry('', registryCredentials) {
				    	dockerImage.push("latest")
				    	}
				}
			}
		}

		    stage ('Stop containers'){
		    	script {
		    		sh 'old_sq_server=docker ps —quiet —filter “name=sql_server'
		    		sh 'docker stop $old_sg_server'
			    	sh 'old_flask_app=docker ps —quiet —filter “name=flask_app'
			    	sh 'docker stop $old_flask_app'
				}
			}
		}

	    	stage ('Deploy to Swarm'){
			    script {
				    sh 'docker swarm init'
			    	sh 'docker stack deploy —compose-file ${compose_file} flask_application'
				}
			}
		}

		    stage('Adding Schema'){
		    	script {
			    	sh 'sql_server_id=docker ps —quiet —filter “name=flask_application_sql”'
			    	sh 'docker exec -it $sql_server_id bash'
			    	sh 'mysql —user=root —password=password'
			    	sh 'create database fmadata'
			    	sh 'exit'
			    	sh 'mysql -user=root -password=password fmadata < schema2.sql'
				}
			}
		}

		    stage('Push Docker-compose file to registry'){
			    script {
				    sh 'docker-compose push'
				}
			}
		}

	    	stage('Push docker containers file to registry'){
		    	script {
			    	sh 'docker-compose push'
				}
			}
		}
	}
