pipeline {
    //Req Operataing System
    agent any 
    
    stages { 
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/IT21229084/CI-CD-Pipeline-with-Docker-and-Jenkins'
                }
            }
        }
        stage('Build Docker Image') {
            steps {  
                bat 'docker build -t iroshancodex/nodeapp:%BUILD_NUMBER% .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
               withCredentials([string(credentialsId: 'IroshanCodexpass', variable: 'IroshanCodexPass')]) {
                    script {
                        bat "docker login -u iroshancodex -p %IroshanCodexPass%"
                    }
                }
            }
        }
        stage('Push Image') {
            steps {
                bat 'docker push iroshancodex/nodeapp:%BUILD_NUMBER%'
            }
        }
    }
    post {
        always {
            bat 'docker logout'
        }
    }
}
