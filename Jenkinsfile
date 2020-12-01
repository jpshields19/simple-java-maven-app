pipeline {
    agent any
    
    stages {
        
        stage('Docker Test') {
            agent any
            steps {
                sh 'ls'
                sh 'docker container ps'
                sh 'docker image ls'
                sh 'docker network ls'
            }
        }
        
        stage('Analyze') {
            agent {
                docker {
                    image 'sonarsource/sonar-scanner-cli'
                    args '-v /var/run/docker.sock:/var/run/docker.sock --entrypoint="" --net jenkins'
                }
            }
            steps {
                sh 'sonar-scanner -Dsonar.source=. -Dsonar.projectKey=com.mycompany.app:my-app -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login=admin -Dsonar.password=admin'
            }
        }
     }
}
