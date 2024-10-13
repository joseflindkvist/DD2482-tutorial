#!/bin/bash
# 🥚🐇
# Create a log file for this step
LOG_FILE="/tmp/s3_lambda_setup.log"

#🔄 Setting up S3 event trigger for Lambda... Please wait.
awslocal lambda wait function-active-v2 --function-name myLambdaFunction

awslocal s3api put-bucket-notification-configuration --bucket my-devops-tutorial-bucket \
    --notification-configuration '{
        "LambdaFunctionConfigurations": [
            {
                "LambdaFunctionArn": "arn:aws:lambda:us-east-1:000000000000:function:myLambdaFunction",
                "Events": ["s3:ObjectCreated:*"]
            }
        ]
    }' >> $LOG_FILE 2>&1

 #✅ S3 event trigger for Lambda set up successfully.

#🔄 Uploading a test file to S3... Please wait.
echo "This is a test file" > test.txt
awslocal s3 cp test.txt s3://my-devops-tutorial-bucket/test.txt >> $LOG_FILE 2>&1

#✅ Test file uploaded successfully.

# Wait for Lambda to process the file
echo "⏳ Waiting for Lambda to process the file... (sleeping for 5 seconds)"
sleep 5

#🔄 Checking log streams for the Lambda function...
awslocal logs describe-log-streams --log-group-name /aws/lambda/myLambdaFunction >> $LOG_FILE 2>&1

    #✅ Log streams retrieved successfully.

