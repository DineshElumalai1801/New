pipeline {
    agent any
    stages {
        stage ('Maven Checks')
        {
            steps {
                sh 'mvn --version'
            }
        }
         stage ('Docker Checks')
        {
            steps {
                sh 'docker --version'
            }
        }
}
}
