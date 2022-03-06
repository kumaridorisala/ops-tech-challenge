pipeline {
    agent any
    tools {
        go 'go1.16'
    }
    environment {
        GO116MODULE = 'on'
        CGO_ENABLED = 0 
        GOPATH = "${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}"
    }
    stages {        
        stage('Trufflehog Scan') {
            steps {
                echo 'Scanning for secrets'
                sh 'rm trufflehog_result || true'
                sh 'docker run gesellix/trufflehog https://github.com/kumaridorisala/ops-tech-challenge --json > trufflehog_result'
                sh 'cat trufflehog_result'
            }
        }
        
        stage('Build app image') {
            steps {
                echo 'Building docker image'
                sh 'Docker build .'
            }
        }
    }
}