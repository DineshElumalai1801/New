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
                    archiveArtifacts artifacts: 'jb-hello-world-maven.jar', fingerprint: true
                }
            }
        }
      /*  stage ('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage ('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'HOURS') {
                    waitForQualityGate abortPipeline: true
                }
            }
        } */

        stage ('Docker image') {
            steps {

                sh 'docker build -t dineshelumalai1801/myapp:latest .'
            }
        }

        stage ('Trivy Scan') {
            steps {
                '''
                   docker run --rm \
                   -v /var/run/docker.sock:/var/run/docker.sock \
                   -v "$PWD:/output" \
                   aquasec/trivy:latest \
                   image -f json -o /output/result.json myapp:latest
                '''
            }

            post {
                always {
                    archiveArtifacts artifacts: 'result.json', fingerprint: true
                }
            }
        }   
}
}
