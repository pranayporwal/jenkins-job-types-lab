pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                echo 'Building Flask application...'

                sh '''
                    python3 --version
                    python3 -m venv .venv
                    .venv/bin/python -m pip install --upgrade pip
                    .venv/bin/python -m pip install -r requirements.txt
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running unit tests...'

                sh '''
                    .venv/bin/python -m unittest discover -s . -p "test_*.py" -v
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Flask application...'

                sh '''
                    mkdir -p "$WORKSPACE/deployment"

                    cp app.py requirements.txt "$WORKSPACE/deployment/"

                    echo "Deployment directory contents:"
                    ls -l "$WORKSPACE/deployment"
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check the console output.'
        }
    }
}