## Step 3: Triggering Lambda with S3 Events

We have configured an S3 event to trigger the Lambda function when a file is uploaded.

The Lambda function has now been triggered by uploading a file to S3.

To check the Lambda logs, run the following command:

```bash
awslocal logs describe-log-streams --log-group-name /aws/lambda/myLambdaFunction
