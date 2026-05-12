pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "MdZain93/image-pqr1"
        DOCKER_TAG = "latest"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop image-pqr1 || true
                docker rm image-pqr1 || true
                docker run -d -p 5001:5000 --name myapp-container $DOCKER_IMAGE:$DOCKER_TAG
                '''
            }
        }
    }
}
