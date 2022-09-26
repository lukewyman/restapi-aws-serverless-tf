# restapi-aws-serverless-tf

This is a demo Serverless REST API using:

- Terraform
- AWS API Gateway REST API
- AWS Lambda (written in Python)
- DynamoDB

If you'd like to try out a deploy and end-to-end integration test, run the following from the root of the project:

To deploy the terraform:
```
$ cd deploy
$ terraform init
$ terraform workspace new test
$ terraform init     # yes, again
$ terraform apply


```