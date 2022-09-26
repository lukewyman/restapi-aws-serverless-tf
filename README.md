# restapi-aws-serverless-tf

This is a demo Serverless REST API using:

- Terraform v1.3.0
- AWS API Gateway REST API
- AWS Lambda / Python 3.9
- DynamoDB

## To Deploy and Test
No dependencies are required to deploy and run, as the Lambdas only use `boto3`. Tests are run with `pytest`. You'll need that, and the `requests` library installed to do so (contained in Pipfile `dev-packages`).
<br />

### Setup Terraform state
The project uses S3 and DynamoDB to manage Terraform state, configured in `deploy/main.tf`, as shown:

```
terraform {
  backend "s3" {
    bucket         = "terraform-state-lw72"
    key            = "terraform-state-lw72.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
```
- create an S3 bucket
- change the `bucket` name to `[your-bucket-name]`.
- change the `key` to `[your-bucket-name].tfstate`.
- create a DynamoDB table
- change the `dynamodb_table` to `[your-table-name]`.

### To deploy the Terraform:
```
$ cd deploy
$ terraform init
$ terraform workspace new test
$ terraform apply
```

The API endpoint URL will be at the bottom of the output at the end of the deployment. 


### To run the end-to-end tests:

Get the todo-items table name:

```
$ terraform output
```
Note the `todo_items_table_name`. It should be `todolist-test-todo-items`.

Seed the test data and run the tests (still in `deploy/`):

```
$ terraform output -json > ../test/integration/tf_outputs.json
$ cd ..
$ python3 seed_data/load_seed_data.py seed_data/seed-items.json todolist-test-todo-items
$ pytest test/integration/
```
You should see that for tests have passed.

### Teardown

```
$ cd deploy
$ terraform destroy
```