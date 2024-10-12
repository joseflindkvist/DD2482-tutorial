if awslocal s3api list-buckets | grep -q "my-devops-tutorial-bucket"; then
    echo "✅ S3 bucket 'my-devops-tutorial-bucket' created successfully."
else
    echo "❌ Failed to create S3 bucket. Please check the previous steps."
    exit 1
fi
