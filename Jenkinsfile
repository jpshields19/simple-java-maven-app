pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
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
                sh 'mvn sonar:sonar -Dsonar.projectKey=com.mycompany.app:my-app -Dsonar.host.url=http://localhost:9000 -Dsonar.login=cada0b0fa6963d76966763b2bcfe75c0bd1b5426'
            }
        }
     }
}
