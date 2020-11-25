pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Defining credentials to clone...'
                sh 'git config --global credential.username ${GIT_USERNAME}'
                sh 'git config --global credential.helper "!echo password=${GIT_PASSWORD}; echo"'
                echo 'Cloning...'
                sh 'git clone https://github.com/AT-12/file-conversion-api-tests.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                sh './gradlew clean build'
            }
            post {
                always {
                    archiveArtifacts artifacts: 'build/libs/**/*.jar'
                }
            }
        }
        stage('Code Quality') {
            steps {
                echo 'Verifying code quality...'
                sh './gradlew check'
            }
        }
        stage('Run Tests') {
            steps {
                echo 'Testing...'
                sh './gradlew test'
            }
            post {
                always {
                    junit 'build/test-results/test/**/*.xml'
                    archiveArtifacts artifacts: 'build/reports/**/*'
                }
            }
        }
        stage('Re-Run Tests') {
            steps {
                echo 'Empty for now! Coming soon.'
            }
        }
        stage('Publish Report') {
            steps {
                echo 'Empty for now! Coming soon.'
            }
        }
    }
}