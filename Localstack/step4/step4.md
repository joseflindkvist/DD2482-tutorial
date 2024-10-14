## Step 4: Creating a DynamoDB table

Let's take this tutorial even further. We will now demonstrate one of LocalStacks many services. LocalStack allows you to use the DynamoDB API's such as *create-table* and *put-item*. In this step, we will use AWS CLI and the awslocal wrapper to create an example table and put an item in the table.

### Step 4.1: Create a DynamoDB Table
We can do this using the CreateTable API. We will create a table named `myDevOpsTutorialTable` using the command below.

**Click** the code block to create the table.

```bash

awslocal dynamodb create-table \
    --table-name myDevOpsTutorialTable \
    --attribute-definitions AttributeName=ID,AttributeType=S \
    --key-schema AttributeName=ID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --stream-specification StreamEnabled=true,StreamViewType=NEW_IMAGE \ >> "/tmp dynamodb_setup.log"
```{{exec}}

The code above defines the following:
- **Table name**: `"myDevOpsTutorialTable"`
- **Attributes**: 
    - `AttributeName=ID`: Defines the `ID` attribute as the primary key.
    - `AttributeType=S`: Specifies that `ID` is a string (DynamoDB types include `S` for string, `N` for number, and `B` for binary).
- **Key Schema**: Defines how items in the table are uniquely identified.
- **Provisioned Throughput**: The table can handle up to 5 consistent reads and writes per second.
- **Stream Specification**: DynamoDB Streams are enabled to track changes such as inserts, updates, and deletes.

### Step 4.2: Insert an Item into the DynamoDB Table
To put an item into the table, we use the `put-item` command. **Click** the code block below to add an item to the table.

```bash
awslocal dynamodb put-item \
    --table-name myDevOpsTutorialTable \
    --item '{"ID": {"S": "123"}, "Name": {"S": "I Love DevOps"}, "Description": {"S": "Please let us"}}' >> "/tmp/dynamodb_setup.log"
```{{exec}}

The code above adds an item with the following fields:
- **ID**: `"123"`
- **Name**: `"I Love DevOps"`
- **Description**: `"Please let us pass"`

### Step 4.3: Query the number of items in the table
You check that the item was added by using the DescribetTable API to query the number of items in the table by running this code:
awslocal dynamodb describe-table \
    --table-name myDevOpsTutorialTable \
    --query 'Table.ItemCount' 
```{{exec}}

Click **Check** to learn how to use a Lambda function to update the DynamoDB table.