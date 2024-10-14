## Step 3: Triggering Lambda with S3 Events

In the previous step, we have configured an S3 event to trigger the Lambda function when a file is uploaded. Let's try it out!

### Step 3.1: Trigger the Lambda Function
We’ll first upload a test file to the S3 bucket. This triggers the Lambda function we created earlier.
The code block below will show you the log output from the Lambda function's execution. ***click***

```
echo "This is a test file" > test.txt
awslocal s3 cp test.txt s3://my-devops-tutorial-bucket/test.txt
```{{exec}}

### Step 3.2: Confirm Execution of Lambda Function. 

Let’s confirm that the Lambda function was executed by checking the log streams. 
Run the command below to list the log streams for the Lambda function. ***click***

```bash
awslocal logs describe-log-streams --log-group-name /aws/lambda/myLambdaFunction
```{{exec}}

This will return a list of log streams. Look for the log stream that matches the invocation time.

### Step 3.3: Confirm Set Up by Viewing Logs. 

 ***click*** the code below to view the logs of our lambda function. If we see *"Hello from Lambda!"*, we've set it up correctly. 

```bash
LOG_STREAM_NAME=$(awslocal logs describe-log-streams --log-group-name /aws/lambda/myLambdaFunction --query 'logStreams[0].logStreamName' --output text)

awslocal logs get-log-events --log-group-name /aws/lambda/myLambdaFunction --log-stream-name "$LOG_STREAM_NAME"

```{{exec}}

➡️ Click **Check** to go to creating a DynamoDB in LocalStack.