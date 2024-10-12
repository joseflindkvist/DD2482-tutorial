## Step 3: Triggering Lambda with S3 Events

We have configured an S3 event to trigger the Lambda function when a file is uploaded. Let's try it out!


This will show you the log output from the Lambda function's execution.

```
echo "This is a test file" > test.txt
awslocal s3 cp test.txt s3://my-devops-tutorial-bucket/test.txt
```{{exec}}

The Lambda function should now be triggered by the file upload.

Let’s confirm that the Lambda function was executed by checking the log streams. Run the command below to list the log streams for the Lambda function:

```bash
awslocal logs describe-log-streams --log-group-name /aws/lambda/myLambdaFunction
```{{exec}}

This will return a list of log streams. Look for the log stream that matches the invocation time.

Once you have the log stream name, replace `<log-stream-name>` in the following command and execute it to view the logs:

```bash
awslocal logs get-log-events --log-group-name /aws/lambda/myLambdaFunction --log-stream-name <log-stream-name>
```

