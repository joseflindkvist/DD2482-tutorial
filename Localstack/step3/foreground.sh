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

echo "File uploaded. Lambda should be triggered!"