#!/bin/bash

# Create a log file for this step
LOG_FILE="/tmp/dynamodb_setup.log"

#🔄 Creating the DynamoDB table... Please wait.
awslocal dynamodb create-table \
    --table-name myDevOpsTutorialTable \
    --attribute-definitions AttributeName=ID,AttributeType=S \
    --key-schema AttributeName=ID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --stream-specification StreamEnabled=true,StreamViewType=NEW_IMAGE >> $LOG_FILE 2>&1

if [ $? -ne 0 ]; then
    #❌ Failed to create DynamoDB table. Exiting.
    cat $LOG_FILE
    exit 1
fi
#✅ DynamoDB table created successfully.

#🔄 Putting an item into the DynamoDB table... Please wait.
awslocal dynamodb put-item \
    --table-name myDevOpsTutorialTable \
    --item '{"ID": {"S": "123"}, "Name": {"S": "Test Item"}, "Description": {"S": "This is a test item for DynamoDB"}}' >> $LOG_FILE 2>&1

if [ $? -ne 0 ]; then
    #❌ Failed to put item into DynamoDB table. Exiting.
    cat $LOG_FILE
    exit 1
fi
#✅ Item successfully put into DynamoDB table.
