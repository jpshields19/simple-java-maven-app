pipeline {
    agent any
    
    stages {
        
        stage('Build') {
            steps {
                script {
                    sh 'docker build -t docker-maven -f DockerfileMaven .'
                    sh 'docker run -d -v /root/.m2:/root/.m2 --name mymaven --network simple-java-maven-app_jenkins docker-maven mvn -B -DskipTests clean package'
                }
            }
        }
        
        stage('Analyze') {
            steps {
                sh 'ping sonarqube'
                script {
                    sh 'docker run sonarsource/sonar-scanner-cli sonar-scanner \
                      -Dsonar.projectKey=com.mycompany.app:my-app \
                      -Dsonar.sources=. \
                      -Dsonar.host.url=http://sonarqube:9000 \
                      -Dsonar.login=89d102c7d196bfdd6a7b14044fb2258f64d60dd0'''
                }
            }
        }
    }
    post {
        always {
            script {
                sh 'docker rm -f mymaven'
            }
        }
    }
}
