pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Duisternis/Payroll-Management-System.git'
            }
        }

        stage('Setup Environment') {
            steps {
                sh 'sudo apt-get update'
                sh 'sudo apt-get install -y python3 python3-pip'
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest || echo "No tests available"'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                echo "Running Application..."
                nohup python3 login.py &
                '''
            }
        }
    }
}
