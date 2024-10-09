# Set up S3 event trigger for Lambda
awslocal s3api put-bucket-notification-configuration --bucket my-devops-tutorial-bucket \
    --notification-configuration '{
        "LambdaFunctionConfigurations": [
            {
                "LambdaFunctionArn": "arn:aws:lambda:us-east-1:000000000000:function:myLambdaFunction",
                "Events": ["s3:ObjectCreated:*"]
            }
        ]
    }'

# Upload a test file to S3 to trigger the Lambda function
echo "This is a test file" > test.txt
awslocal s3 cp test.txt s3://my-devops-tutorial-bucket/test.txt

# Wait a bit to ensure Lambda execution completes
sleep 5

# Confirm the file upload and Lambda trigger
echo "File uploaded and Lambda should be triggered! Checking log streams..."

# Describe the log streams for the Lambda function
awslocal logs describe-log-streams --log-group-name /aws/lambda/myLambdaFunction
