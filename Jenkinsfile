pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/VIVEKANANDHA-P/Payroll.git', branch: 'main'
            }
        }

        stage('Set up Python & Virtual Environment') {
            steps {
                sh '''
                    python3 -m venv $VENV_DIR
                    . $VENV_DIR/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    . $VENV_DIR/bin/activate
                    python -m unittest discover -s tests
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    . $VENV_DIR/bin/activate
                    nohup python main.py &
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
