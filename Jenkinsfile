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
                sh """
                docker build -t $Image_Name:latest .
                docker tag $Image_Name:latest $Image_Name:$BUILD_NUMBER
                """
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
                // Use double quotes so Jenkins can inject the $Image_Name variable
                sh """
                # Pull the latest image to ensure we aren't using a cached stale version
                docker pull $Image_Name:latest
                
                # Stop and remove existing container
                docker stop portfolio || true
                docker rm portfolio || true
                
                # Run the new container
                docker run -d -p 9090:80 --name portfolio $Image_Name:latest
                """
            }
        }
        }
    }
}
