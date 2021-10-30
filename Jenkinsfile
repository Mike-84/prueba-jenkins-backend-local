

pipeline {
    agent {
        label 'master'
    }

    stages {
        stage('Ejecutar linters flake8 y hadolint') {
            steps {
                script {
                    sh "cd backend"
                    sh "docker run -i --rm -v ${pwd}:/apps alpine/flake8:3.5.0 --max-line-length=120 *.py"
                    sh "docker run --rm -i hadolint/hadolint < Dockerfile"
                }
            }
        }

        stage('test unitarios') {
            steps {
                script {
                    sh "cd backend"
                    sh "docker build --no-cache -t backend-test -f Dockerfile.test ."
                    sh "docker run -it --name backend-test backend-test"
                    sh "docker cp backend-test:/app/test_results.xml ./test_results.xml"
                    sh "docker rm backend-test"
                    sh "cat test_results.xml"
                }
            }
        }

        stage('Publicar artefacto a nexus') {
            steps{
              script{
                sh "cd backend"
                sh "docker build --no-cache -t backend-test:1.0.0 ."
                sh "docker login -u admin -p admin localhost:8082"
                sh "docker image tag backend-test:1.0.0 localhost:8082/backend-test:1.0.0"
                sh "docker image push localhost:8082/backend-test:1.0.0"
              }
            }
        }

    }

    post {
        cleanup {
            cleanWs()
        }
    }
}
