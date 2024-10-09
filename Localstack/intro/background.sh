# Install Docker
apt-get update
apt-get install -y docker.io python3-pip

# Install LocalStack via pip
pip3 install localstack awscli-local

# Start LocalStack in the background
localstack start &

# Wait for LocalStack to be ready
sleep 15
