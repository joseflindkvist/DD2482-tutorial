#!/bin/bash

#🔄 Creating the Lambda function file... Please wait.
cat <<EOF > lambda_function.py
def handler(event, context):
    print("Hello from Lambda!")
    return {"statusCode": 200, "body": "Function executed successfully"}
EOF
#✅ Lambda function file created.

#🔄 Zipping the Lambda function... This might take a moment.
zip function.zip lambda_function.py > /dev/null 2>&1
#✅ Lambda function zipped into function.zip.

#🔄 Deploying the Lambda function to LocalStack... Hang tight.
awslocal lambda create-function --function-name myLambdaFunction \
    --runtime python3.8 \
    --handler lambda_function.handler \
    --zip-file fileb://function.zip \
    --role arn:aws:iam::000000000000:role/lambda-role > /dev/null 2>&1
#✅ Lambda function deployed to LocalStack.

#🔄 Listing available Lambda functions...
awslocal lambda list-functions | tee /dev/null
#✅ Lambda functions listed.
