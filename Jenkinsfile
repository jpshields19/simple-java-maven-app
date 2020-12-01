pipeline {
    agent any
    
    stages {
        
        stage('Build') {
            agent any
            steps {
                script {
                    sh '''docker run -it --rm \
                           -v "$(pwd)":/opt/maven \
                           -w /opt/maven \
                           maven:3.2-jdk-7 \
                           mvn clean install'''
                    sh 'ls'
                }
            }
        }
        
        
     }
}
