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
        
        stage('Analyze') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.projectKey=com.mycompany.app:my-app -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login=admin -Dsonar.password=admin'
            }
        }
     }
}
