## Step 1: Creating an S3 Bucket with LocalStack

Now that LocalStack is running, let's create an S3 bucket.

Run the following command to create the S3 bucket:

````
awslocal s3api create-bucket --bucket my-devops-tutorial-bucket
```{{exec}}
