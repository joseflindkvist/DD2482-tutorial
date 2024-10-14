#!/bin/bash

# Ensure that LocalStack is up and running
localstack start &

# Wait for LocalStack to initialize (adjust sleep time as necessary)
sleep 15

# Ensure boto3 is installed (for Python AWS SDK)
pip3 install boto3 > /dev/null 2>&1

# Check if the necessary services are running (DynamoDB and Lambda)
echo "⏳ Checking if LocalStack DynamoDB and Lambda are running..."

while ! curl -s http://localhost:4566/health | grep "\"dynamodb\": \"running\"" > /dev/null; do
  echo -n "⏳ Waiting for DynamoDB..."
  sleep 2
done

while ! curl -s http://localhost:4566/health | grep "\"lambda\": \"running\"" > /dev/null; do
  echo -n "⏳ Waiting for Lambda..."
  sleep 2
done

echo ""
echo "🚀 LocalStack DynamoDB and Lambda are ready."

##Background executeion failed