## Step 2: Creating an AWS Lambda Function
Lambda on LocalStack enables you to simulate AWS Lambda functions in a local development environment, allowing you to test and develop serverless applications without relying on the AWS cloud.

In this step, we will create an AWS Lambda function that will be triggered by S3 events *(notification triggered by specific actions or changes that within an Amazon S3 bucket)*. The following script will generate a basic Python Lambda function and deploy it using LocalStack. While steps 1-3 will run automatically in the background, let's take a minute to review them to understand the process:

### Step 2.1: Create the Lambda function**
In this step, we create a simple Lambda function that prints "Hello from Lambda". 
```
def handler(event, context):
    print("Hello from Lambda!")
    return {"statusCode": 200, "body": "Function executed successfully"}
```

### Step 2.2: Zip the Lambda function**
When you deploy a Lambda function, AWS requires that the code and its dependencies are packaged in a compressed format such as *.zip*.
```
zip function.zip lambda_function.py
```
### Step 2.3: Deploy the Lambda function to LocalStack**
We use the 
```
awslocal lambda create-function --function-name myLambdaFunction \
    --runtime python3.8 \
    --handler lambda_function.handler \
    --zip-file fileb://function.zip \
    --role arn:aws:iam::000000000000:role/lambda-role
```

### Step 2.4: Verify Lambda function

You can verify the Lambda function by listing all functions in LocalStack.
***Click the code below to list all functions***. 

```
awslocal lambda list-functions
```{{exec}}

➡️ Click **Check** to set up S3 event triggers and test the Lambda function.