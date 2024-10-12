if awslocal lambda list-functions | grep -q "myLambdaFunction"; then
    echo "✅ Lambda function 'myLambdaFunction' created successfully."
else
    echo "❌ Failed to create Lambda function. Please check the previous steps."
    exit 1
fi
