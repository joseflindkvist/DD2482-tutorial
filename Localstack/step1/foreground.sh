#!/bin/bash

# Disable command echoing
set +x

# Step 1: Updating package lists
echo "🔄 Updating package lists... Please wait."
apt-get update > /dev/null 2>&1
echo "✅ Package lists updated."

# Step 2: Installing Docker and Python pip
echo "🔄 Installing Docker and Python pip... This may take a moment."
apt-get install -y docker.io python3-pip > /dev/null 2>&1
echo "✅ Docker and Python pip installed."

# Step 3: Installing LocalStack, AWS CLI, and awslocal CLI helper
echo "🔄 Installing LocalStack, AWS CLI, and awslocal CLI helper... Hang tight."
pip3 install localstack awscli awscli-local > /dev/null 2>&1
echo "✅ LocalStack, AWS CLI, and awslocal installed."

# Step 4: Starting LocalStack
echo "🔄 Starting LocalStack... This might take a few seconds."
localstack start & > /dev/null 2>&1

# Step 5: Waiting for LocalStack to be fully ready
echo "⏳ Waiting for LocalStack to be ready..."
while ! curl -s http://localhost:4566/health | grep "\"s3\": \"running\"" > /dev/null; do
  echo -n "⏳"
  sleep 2
done

echo ""
echo "🚀 LocalStack is ready! You can now proceed to the next step."
