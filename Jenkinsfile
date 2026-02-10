pipeline {
    agent any
    environment {
        DockerHub_Credentials = credentials('sanju1701')
        Image_Name = "sanju1701/portfolio-website-static"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Sanjeevan-17/Portfolio-Website.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh """
                echo \$DockerHub_Credentials_PSW | docker login -u \$DockerHub_Credentials_USR --password-stdin
                docker push $Image_Name:latest
                docker push $Image_Name:$BUILD_NUMBER
                """
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop portfolio || true
                docker rm portfolio || true
                docker run -d -p 80:80 --name portfolio $DOCKER_IMAGE
                '''
            }
        }
    }
}
