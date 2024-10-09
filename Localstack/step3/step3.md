## Step 3: Triggering Lambda with S3 Events

We have configured an S3 event to trigger the Lambda function when a file is uploaded.

The Lambda function has now been triggered by uploading a file to S3.

You can verify the Lambda invocation by checking the logs.

### Check the log streams:

```bash
awslocal logs get-log-events --log-group-name /aws/lambda/myLambdaFunction --log-stream-name <log-stream-name>
```

This will show you the log output from the Lambda function's execution.
