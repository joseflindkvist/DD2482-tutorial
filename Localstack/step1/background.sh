# Update package lists and install Docker and Python pip
apt-get update
apt-get install -y docker.io python3-pip zip

# Install LocalStack, AWS CLI, and awslocal CLI helper
pip3 install localstack awscli awscli-local

# Start LocalStack in the background
localstack start

echo "LocalStack is ready! You can now proceed to the next step."
