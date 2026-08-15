pipeline {
    agent any
    stages {
        stage ('Tool Check') {
            steps {
                sh 'mvn --version'
                sh 'docker --version'
            }
            }
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
            post {
                always {
                    archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
                }
            }
        }

}
}
