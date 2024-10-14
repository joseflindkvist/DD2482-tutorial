# Tutorial Complete!

Congratulations on completing the tutorial! 🎉

**Summary**

*Step 1: Creating an S3 Bucket with LocalStack*

We set up LocalStack and created an S3 bucket using the awslocal command. This provided a simulated AWS environment for storing files locally.

*Step 2: Deploying a Lambda Function*

We created a simple Lambda function, zipped it, and deployed it to LocalStack. This allowed us to emulate AWS Lambda serverless functions in a local environment.

*Step 3: Triggering Lambda via S3 Events*

We configured an S3 event to trigger the Lambda function whenever a file is uploaded to the S3 bucket. We then verified the function execution by checking the logs to ensure the Lambda function was triggered successfully.

*Step 4: Creating and Interacting with a DynamoDB Table*
In this step, we demonstrated how to use LocalStack to simulate AWS DynamoDB services. We created a DynamoDB table named myDevOpsTutorialTable and inserted an item into the table using the put-item command. After inserting the item, we verified the table's contents by querying the number of items to ensure that the operation was successful.

*Step 5: Triggering Lambda via S3 Events*
We extended the functionality of our Lambda function to interact with the DynamoDB table. By modifying the Lambda code, we enabled it to insert new data into the DynamoDB table whenever triggered by an S3 event. After redeploying the Lambda function, we uploaded a file to the S3 bucket, which triggered the function, and confirmed the successful insertion of a new item by scanning the DynamoDB table.

Thank you for participating!
