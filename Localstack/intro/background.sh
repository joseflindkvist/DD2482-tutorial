# Update package lists and install Docker and Python pip
apt-get update
apt-get install -y docker.io python3-pip

# Install LocalStack, AWS CLI, and awslocal CLI helper
pip3 install localstack awscli awscli-local

# Start LocalStack in the background
localstack start &

# Wait for LocalStack to be fully initialized
echo "Waiting for LocalStack to initialize..."
until curl -s http://localhost:4566/health | grep "\"s3\": \"running\"" > /dev/null; do
  sleep 5
  echo "Waiting for LocalStack to be ready..."
done

echo "LocalStack is ready! You can now proceed to the next step."
