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
        stage('Deploy kafka-cage-temperature history producer to Marathon') {
            steps {
                echo "Starting application deployment"
                script {
                    marathon(
                        url: 'http://marathon.mesos:8080',
                        forceUpdate: true,
                        id: '/dept-a/kafka-cage-temp-marathon',
                        docker: 'markfjohnson/dev-python',
                        filename: 'conf/kafka-cage-temp-marathon.json',
                        dockerForcePull: true)
                    marathon(
                        url: 'http://marathon.mesos:8080',
                        forceUpdate: true,
                        id: '/dept-a/kafka-food',
                        docker: 'markfjohnson/dev-python',
                        filename: 'conf/kafka-food-marathon.json',
                        dockerForcePull: true)

                }
            }
        }

    }
}