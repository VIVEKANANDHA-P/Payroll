pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/VIVEKANANDHA-P/Payroll.git'
        VENV_DIR = 'venv'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${https://github.com/VIVEKANANDHA-P/Payroll.git}", branch: 'main'
            }
        }

        stage('Set Up Python Environment') {
            steps {
                sh '''
                    python3 -m venv ${VENV_DIR}
                    source ${VENV_DIR}/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run App or Tests') {
            steps {
                sh '''
                    source ${VENV_DIR}/bin/activate
                    # Example: run a Python script (adjust if needed)
                    python login.py
                '''
            }
        }

        stage('Deploy (Optional)') {
            steps {
                echo "Deployment step can go here if you're using another service or script."
                // You can SCP to another server, use Docker, etc.
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
