# Tutorial Complete!

Congratulations on completing the tutorial! 🎉

**Summary**

*Step 1: Creating an S3 Bucket with LocalStack*

We set up LocalStack and created an S3 bucket using the awslocal command. This provided a simulated AWS environment for storing files locally.

*Step 2: Deploying a Lambda Function*

We created a simple Lambda function, zipped it, and deployed it to LocalStack. This allowed us to emulate AWS Lambda serverless functions in a local environment.

*Step 3: Triggering Lambda via S3 Events*

We configured an S3 event to trigger the Lambda function whenever a file is uploaded to the S3 bucket. We then verified the function execution by checking the logs to ensure the Lambda function was triggered successfully.


*Step 5: Modify the Lambda function to interact with DynamoDB*

In this step, we modified the Lambda function to interact with DynamoDB. Now, every time a file is uploaded to the S3 bucket, the Lambda function inserts a new item into the DynamoDB table, simulating how Lambda can be used to interact with other AWS services in a serverless architecture.


Thank you for participating!
