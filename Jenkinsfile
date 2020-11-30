pipeline {
    agent none
    
    stages {
        stage('Build') { 
            agent {	
                docker {	
                    image 'maven:3-alpine' 	
                    args '-v /root/.m2:/root/.m2' 	
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
            agent any
            steps {
                withSonarQubeEnv('My SonarQube Server') { // You can override the credential to be used
                  sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
                }
            }
        }
     }
}
