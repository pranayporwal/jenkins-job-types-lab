#!/bin/bash

echo "================================"
echo "Starting System Health Check"
echo "================================"

echo "Checking required project files..."

FILES=("app.py" "requirements.txt" "test_app.py" "Jenkinsfile")

for FILE in "${FILES[@]}"; do
    if [ -f "$FILE" ]; then
        echo "PASS: $FILE exists"
    else
        echo "FAIL: $FILE is missing"
        exit 1
    fi
done

echo "================================"
echo "Health Check Completed Successfully!"
echo "================================"