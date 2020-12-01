pipeline {
    agent any
    
    stages {
        
        stage('Build') {
            steps {
                script {
                    sh 'docker rm -f mymaven'
                    sh 'docker build -t docker-maven -f DockerfileMaven .'
                    sh 'docker run -v /root/.m2:/root/.m2 --name mymaven docker-maven mvn -B -DskipTests clean package'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'docker container ps'
                    sh 'docker run -v /root/.m2:/root/.m2 --name mymaven docker-maven mvn test'
                }
            }
        }
        
        
     }
}
