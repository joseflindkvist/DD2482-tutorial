###Step 5: Modify the Lambda function to interact with DynamoDB

We will modify the existing Lambda function so that, when triggered by an S3 event, it writes data to the DynamoDB table.

Click the button below to update the Lambda function code:

```
cat <<EOF > lambda_function.py
import boto3

def handler(event, context):
    dynamodb = boto3.resource('dynamodb', endpoint_url='http://localhost:4566')
    table = dynamodb.Table('myDevOpsTutorialTable')

    # Put an item into DynamoDB
    table.put_item(
       Item={
            'ID': '456',  # You can make this dynamic based on event or logic
            'Name': 'S3 Event Triggered',
            'Description': 'This item was created by a Lambda function triggered by an S3 event.'
        }
    )

    print("Item inserted into DynamoDB!")
    return {"statusCode": 200, "body": "DynamoDB interaction successful!"}
EOF
```{{exec}}

This code modifies the Lambda function to write a new item to the DynamoDB table every time it is triggered by an S3 event.

Now, zip the modified Lambda function and redeploy it:

```bash
zip function.zip lambda_function.py
```{{exec}}

Update the Lambda function with the new code:

```bash
awslocal lambda update-function-code --function-name myLambdaFunction --zip-file fileb://function.zip
```{{exec}}

To trigger the Lambda function, upload another test file to the S3 bucket. This will cause the Lambda function to execute and insert a new item into the DynamoDB table:

```bash
echo "test file" > test3.txt
awslocal s3 cp test3.txt s3://my-devops-tutorial-bucket/test3.txt
```{{exec}}

Now, let’s verify that the Lambda function successfully inserted the item into the DynamoDB table. Use the following command to scan the table and view all items:

```bash
awslocal dynamodb scan --table-name myDevOpsTutorialTable
```{{exec}}

You should see the new item added by the Lambda function.