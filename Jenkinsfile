pipeline {
    agent any
    
    stages {
        
        stage('Build') {
            agent any
            steps {
                script {
                    sh 'docker run --rm -v /root/.m2:/root/.m2 maven:3-alpine mvn -B -DskipTests clean package'
                    sh 'ls'
                }
            }
        }
        
        
     }
}
