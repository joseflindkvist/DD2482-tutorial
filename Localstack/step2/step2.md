## Step 2: Creating an AWS Lambda Function

We will now create an AWS Lambda function that will be triggered by S3 events.

A Python Lambda function has been created and deployed locally.

You can verify the Lambda function by listing all functions in LocalStack:

```bash
awslocal lambda list-functions
