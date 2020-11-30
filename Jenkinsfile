pipeline {
    agent {	
        docker {	
            image 'maven:3-alpine' 	
            args '-v /root/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock' 	
        }	
    }
    
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage("build & SonarQube analysis") {
            agent any
            steps {
              withSonarQubeEnv('My SonarQube Server') {
                sh 'mvn clean package sonar:sonar'
              }
            }
          }
     }
}
