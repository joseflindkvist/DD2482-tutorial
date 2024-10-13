## Step 2: Creating an AWS Lambda Function

We will now create an AWS Lambda function that will be triggered by S3 events. Next, we’re running this script. It creates a basic Python Lambda function file and deploys it using LocalStack. 


First we create the Lambda function:
```
def handler(event, context):
    print("Hello from Lambda!")
    return {"statusCode": 200, "body": "Function executed successfully"}
```

Then we zip the Lambda function:
```
zip function.zip lambda_function.py
```
And finally we deploy the Lambda function to LocalStack:
```
awslocal lambda create-function --function-name myLambdaFunction \
    --runtime python3.8 \
    --handler lambda_function.handler \
    --zip-file fileb://function.zip \
    --role arn:aws:iam::000000000000:role/lambda-role
```

##
You can verify the Lambda function by listing all functions in LocalStack (***click***):

```
awslocal lambda list-functions
```{{exec}}

Click **Check** to set up S3 event triggers and test the Lambda function.