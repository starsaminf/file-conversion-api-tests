pipeline {
    agent any
    triggers {
        pollSCM('H/5 * * * *')
    }

    environment {
        JAVA_HOME = '/usr/lib/jvm/java-11-openjdk'
        PATH      = '$JAVA_HOME/bin:$PATH'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Cleaning...'
                sh 'rm -r file-conversion-api-tests'
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
        stage('Run BDD Tests') {
            steps {
                echo 'Running BDD Tests...'
                sh './gradlew executeBDDTests'
            }
        post {
                always {
                    archiveArtifacts artifacts: '/build/reports/allure-report/*'
                }
            }
        }
        stage('Re-Run BDD Tests') {
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