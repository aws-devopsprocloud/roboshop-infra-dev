pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    } 
    options {
        disableConcurrentBuilds()
        ansiColor('xterm')
        timeout(time: 1, unit: 'HOURS')
    }
    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Pick something')
    }
    stages {
        stage('VPC') {
            steps {
                sh """
                    cd 01-vpc
                    terraform init -reconfigure
                    cd 01-vpc
                    terraform apply -auto-approve
                """
            }
        }
        stage('SG') {
            steps {
                sh """
                    cd 02-sg
                    terraform init -reconfigure
                    cd 02-sg
                    terraform apply -auto-approve
                """
            }
        }
        stage('SG-Rules') {
            steps {
                sh """
                    cd 03-sg-rules
                    terraform init -reconfigure
                    cd 03-sg-rules
                    terraform apply -auto-approve
                """
            }
        }
        stage('VPN') {
            steps {
                sh """
                    cd 04-vpn
                    terraform init -reconfigure
                    cd 04-vpn
                    terraform apply -auto-approve
                """
            }
        }
        stage('Databases') {
            steps {
                sh """
                    cd 05-databases
                    terraform init -reconfigure
                    cd 05-databases
                    terraform apply -auto-approve
                """
            }
        }
        
    }
    post {
        always {
            echo 'PIPELINE EXECUTION IS COMPLETED'
        }
        failure {
            echo 'The pipeline is FAILED'
        }
        success {
            echo 'The pipeline is SUCESS'
        }
    }
}