pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git repository
                git 'https://github.com/i-talha/My-Umbrella-Jenkins.git'
            }
        }
        stage('Set Up Elixir') {
            steps {
                sh '''
                mix local.hex --force
                mix local.rebar --force
                mix deps.get
                '''
            }
        }
        stage('Format') {
            steps {
                sh 'mix format --check-formatted'
            }
        }
        stage('Compile') {
            steps {
                sh 'mix compile --warnings-as-errors'
            }
        }
        stage('Credo') {
            steps {
                sh 'mix credo --strict'
            }
        }
        stage('Dialyzer') {
            steps {
                sh 'mix dialyzer'
            }
        }
        stage('Test') {
            steps {
                sh 'mix test'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
