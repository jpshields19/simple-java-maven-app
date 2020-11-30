pipeline {
    agent none
    
    stages {
        stage('Build') { 
            agent {	
                docker {	
                    image 'maven:3-alpine' 	
                    args '-v /root/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock' 	
                }	
            }
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        
        stage('Test') {
            agent {	
                docker {	
                    image 'maven:3-alpine' 	
                    args '-v /root/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock' 	
                }	
            }
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Analyze') {
            agent {
                docker {
                    image 'sonarsource/sonar-scanner-cli'
                    args '-v /var/run/docker.sock:/var/run/docker.sock --entrypoint=""'
                }
            }
            steps {
                sh 'sonar-scanner -Dsonar.source=. -Dsonar.projectKey=com.mycompany.app:my-app -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login=admin -Dsonar.password=admin'
            }
        }
     }
}
