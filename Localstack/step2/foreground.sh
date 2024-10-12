# Step 2: Create and Deploy the Lambda Function

# Create the Lambda function file
cat <<EOF > lambda_function.py
def handler(event, context):
    print("Hello from Lambda!")
    return {"statusCode": 200, "body": "Function executed successfully"}
EOF

# Zip the Lambda function
apt install zip

zip function.zip lambda_function.py

# Create the Lambda function in LocalStack
awslocal lambda create-function --function-name myLambdaFunction \
    --runtime python3.8 \
    --handler lambda_function.handler \
    --zip-file fileb://function.zip \
    --role arn:aws:iam::000000000000:role/lambda-role

# Confirm that the function has been created
echo "Lambda function created. Listing available Lambda functions..."
awslocal lambda list-functions
