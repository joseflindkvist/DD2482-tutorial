## Step 1: Creating an S3 Bucket with LocalStack

The first step is to install the necessary tools to complete this tutorial.
Don't worry, we've already started, No need to install these yourself!

These tools include…

- LocalStack
  ` pip3 install localstack`
- The software platform Docker
  `apt-get install -y docker.io`
- The command line interface AWS CLI
  `pip3 install awscli awscli-local`
- Python pip3
  `install python3-pip`

### Introduction to LocalStack

While we wait for the installation to complete, let’s talk about LocalStack!

LocalStack is a fully functional local cloud environment that allows you to emulate AWS (Amazon Web Services) services on your local machine. It replicates the behavior of several AWS services without needing to connect to the actual AWS cloud. This is especially useful in DevOps and software development because:

- **No Need for an AWS Account**: You don’t need an AWS account or access to the internet to test your cloud-based applications.
- **Cost Savings**: By using LocalStack, you avoid cloud service costs while developing and testing your infrastructure locally.
- **Fast Feedback Loop**: You can quickly spin up and test resources (like S3 buckets, Lambda functions, and API Gateways) on your local machine without waiting for cloud provisioning times.
- **Simulated Environment**: LocalStack provides local versions of many AWS services, such as:

  - **S3**: For object storage.
  - **Lambda**: For serverless functions.
  - **DynamoDB**: For NoSQL database operations.
  - **API Gateway**: For managing and deploying APIs. 

LocalStack can be integrated into your CI/CD pipelines to run automated tests locally before deploying to production, making it ideal for teams adopting a DevOps workflow.

![understanding-local-stack-schema](./image.png)

***Representation of a development flow where LocalStack is used throughout local development and CI stages to simulate AWS services, and finally, the application is deployed to AWS for production use.***

![local-development-setup](./graph.png)

***How a local development setup can interact with LocalStack to perform AWS services such as S3, Lambda, DynamoDB during the development process, all within a Docker container.***

---
*Wait for installation to complete. Its ready when you see "Ready" in the terminal.*

### Step 1.1: Create an S3 bucket. 
An S3 bucket is a container used for storing data (objects) in Amazon S3. 
***Click on the code below to create the S3 bucket and then list all buckets***:
```
awslocal s3api create-bucket --bucket my-devops-tutorial-bucket
awslocal s3api list-buckets

```{{exec}}

➡️ Click **Check** to move on to creating a Lambda function.
