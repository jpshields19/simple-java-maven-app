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
            }
        }
        
        stage('Analyze') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.projectKey=com.mycompany.app:my-app -Dsonar.host.url=http://host.docker.internal:9000 -Dsonar.login=admin -Dsonar.password=admin'
            }
        }
     }
}
