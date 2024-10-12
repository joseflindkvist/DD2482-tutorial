#!/bin/bash

# Disable command echoing
set +x

🔄 Updating package lists... Please wait.
apt-get update > /dev/null 2>&1
echo "✅ Package lists updated."

🔄 Installing Docker and Python pip... This might take a few seconds.
apt-get install -y docker.io python3-pip > /dev/null 2>&1
echo "✅ Docker and Python pip installed."

🔄 Installing LocalStack, AWS CLI, and awslocal CLI helper... Hang tight.
pip3 install localstack awscli awscli-local > /dev/null 2>&1
echo "✅ LocalStack, AWS CLI, and awslocal installed."

🔄 Starting LocalStack... This may take a moment.
localstack start & > /dev/null 2>&1

⏳ Waiting for LocalStack to be ready...
while ! curl -s http://localhost:4566/health | grep "\"s3\": \"running\"" > /dev/null; do
  echo -n "⏳"
  sleep 2
done

echo ""
echo "🚀 LocalStack is ready! You can now proceed to the next step."
