
# Create the Lambda function file
cat <<EOF > lambda_function.py
def handler(event, context):
    print("Hello from Lambda!")
    return {"statusCode": 200, "body": "Function executed successfully"}
EOF

# Zip the Lambda function
zip function.zip lambda_function.py

# Deploy the Lambda function to LocalStack
awslocal lambda create-function --function-name myLambdaFunction \
    --runtime python3.8 \
    --handler lambda_function.handler \
    --zip-file fileb://function.zip \
    --role arn:aws:iam::000000000000:role/lambda-role

echo "Lambda function created. Ready to integrate with S3!"