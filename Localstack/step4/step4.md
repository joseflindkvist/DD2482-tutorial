## Step 4: Creating a DynamoDB table

Let's take this tutorial even further. We will now use LocalStack to create a DynamoDB table and put an item into the table using the AWS CLI.

### Create a DynamoDB Table
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

### Insert an Item into the DynamoDB Table
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
