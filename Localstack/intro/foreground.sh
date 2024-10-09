# This script can be empty if no foreground interaction is needed in the intro.
echo "Welcome! Let's set up LocalStack. Click the 'Next' button to begin!"

# Install Docker and LocalStack
apt-get update
apt-get install -y docker.io python3-pip

# Install LocalStack and awscli-local
pip3 install localstack awscli-local

# Start LocalStack in the background
localstack start &

# Wait for LocalStack to be ready
sleep 15

# Check if awslocal is installed correctly
if ! command -v awslocal &> /dev/null
then
    echo "awslocal could not be found. You can still use aws with --endpoint-url."
else
    echo "awslocal is installed and ready!"
fi
