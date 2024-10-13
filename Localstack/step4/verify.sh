#!/bin/bash

#🔄 Verifying if the DynamoDB table and replicas were created successfully...

# Check if the DynamoDB table exists
TABLE_EXISTS=$(awslocal dynamodb list-tables | grep -q "myDevOpsTutorialTable"; echo $?)

if [ $TABLE_EXISTS -eq 0 ]; then
    echo "✅ DynamoDB table 'myDevOpsTutorialTable' created successfully."
else
    echo "❌ DynamoDB table not found. Please check the previous steps."
    exit 1
fi

# Check for table replicas
REPLICA_REGIONS=$(awslocal dynamodb describe-table --table-name myDevOpsTutorialTable --query 'Table.Replicas[*].RegionName' --output text)

if [[ "$REPLICA_REGIONS" == *"us-west-1"* && "$REPLICA_REGIONS" == *"eu-west-1"* ]]; then
    echo "✅ Replicas for DynamoDB table created successfully in 'us-west-1' and 'eu-west-1'."
else
    echo "❌ Replicas not found. Please check the previous steps."
    exit 1
fi

# Verify that the item exists in the DynamoDB table
ITEM_EXISTS=$(awslocal dynamodb get-item --table-name myDevOpsTutorialTable --key '{"ID": {"S": "123"}}' --query 'Item' --output text)

if [ -n "$ITEM_EXISTS" ]; then
    echo "✅ Item found in DynamoDB table."
else
    echo "❌ Failed to retrieve item from DynamoDB table. Please check the previous steps."
    exit 1
fi
