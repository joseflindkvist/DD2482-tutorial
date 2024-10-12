LOG_STREAM_NAME=$(awslocal logs describe-log-streams --log-group-name /aws/lambda/myLambdaFunction --query 'logStreams[0].logStreamName' --output text)

if [ -n "$LOG_STREAM_NAME" ]; then
    echo "Log stream found: $LOG_STREAM_NAME"
    awslocal logs get-log-events --log-group-name /aws/lambda/myLambdaFunction --log-stream-name "$LOG_STREAM_NAME"
else
    echo "❌ No log stream found for Lambda function execution. Please check if the event triggered correctly."
    exit 1
fi
