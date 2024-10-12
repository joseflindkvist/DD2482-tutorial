# Update package lists and install Docker and Python pip
echo "Updating package lists..."
apt-get update

echo "Installing Docker and Python pip..."
apt-get install -y docker.io python3-pip

# Install LocalStack, AWS CLI, and awslocal CLI helper
echo "Installing LocalStack, AWS CLI, and awslocal CLI helper..."
pip3 install localstack awscli awscli-local &

# Start LocalStack in the background
echo "Starting LocalStack..."
localstack start &

# Display a loading message while waiting for LocalStack to start
echo "Waiting for LocalStack to be ready..."
while ! curl -s http://localhost:4566/health | grep "\"s3\": \"running\"" > /dev/null; do
  echo -n "."
  sleep 2
done

echo ""
echo "LocalStack is ready! You can now proceed to the next step."
