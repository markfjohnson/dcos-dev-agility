node {
    agent any

    stages {
        stage('pull source') {
            steps {
                echo 'Pulling down the source code'
                git url: 'https://github.com/markfjohnson/dcos-dev-agility.git'
            }
        }
        stage('build base docker image') {
            steps {
                echo 'Starting Docker image build'
                def customImage = docker.build("my-image:${env.BUILD_ID}")
                customImage.push('latest')
            }
        }
        stage('Test docker image') {
            steps {
                echo 'Testing docker image'
            }
        }
    }
}