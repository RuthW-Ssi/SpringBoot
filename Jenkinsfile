pipeline {
    agent any
    environment {
        APP_NAME = "test app name"
    }
    stages {
        stage('Build Image'){
            steps {
                sh "echo ${env.APP_NAME}"
            }
        }
        stage('Build Stage (Docker)'){
            // agent label สำหรับ run เครื่องคนอื่น
            agent {label 'build-server'}
            steps {
                sh "docker build -t ghcr.io/ruthw-ssi/springboot ."
            }
        }
        stage('Deliver Docker Image') {
            agent {label 'build-server'}
            steps {
                withCredentials(
                [usernamePassword(
                    credentialsId: 'ruthw-ssi',
                    passwordVariable: 'githubPassword',
                    usernameVariable: 'githubUser'
                )]
            ){
                sh "docker login ghcr.io -u ${env.githubUser} -p ${env.githubPassword}"
                sh "docker push ghcr.io/ruthw-ssi/springboot"
            }
            }
        }
        }
    }
}