resource "aws_dynamodb_table" "projects" {
  name         = "${local.prefix}-projects"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "project_id"

  attribute {
    name = "project_id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "todos" {
  name         = "${local.prefix}-todos"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "project_id"
  range_key    = "todo_id"

  attribute {
    name = "project_id"
    type = "S"
  }

  attribute {
    name = "todo_id"
    type = "S"
  }
}