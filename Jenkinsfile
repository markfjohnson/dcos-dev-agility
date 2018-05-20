pipeline {
    agent any
    stages {
        stage('pull source') {
            steps {
                echo 'Pulling down the source code'
                git url: 'https://github.com/markfjohnson/dcos-dev-agility.git'
                stash name:'scm', includes:'*'
            }
        }
        stage('build base docker image') {
            steps {
                echo 'Starting Docker image build'
                unstash 'scm'
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
                        app = docker.build("markfjohnson/dev-python")
                        app.push()
                        app.push('latest')
                    }
                }
            }
        }
        stage('Test docker image to run python programs') {
            steps {
                script {
                    docker.image("markfjohnson/dev-python")
                }
            }
        }
        stage('Deploy docker image to Marathon') {

    }
}