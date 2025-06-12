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
                    source $VENV_DIR/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    source $VENV_DIR/bin/activate
                    # Replace with your test framework if needed (e.g. pytest, unittest)
                    python -m unittest discover -s tests
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    source $VENV_DIR/bin/activate
                    # Example: start the app (adjust based on your main script)
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
