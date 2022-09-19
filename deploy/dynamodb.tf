resource "aws_dynamodb_table" "todo_lists" {
  name         = "${local.prefix}-todo-lists"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "list_name"

  attribute {
    name = "list_name"
    type = "S"
  }
}

resource "aws_dynamodb_table" "todo_items" {
  name         = "${local.prefix}-todo-items"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "list_name"
  range_key    = "item_name"

  attribute {
    name = "list_name"
    type = "S"
  }

  attribute {
    name = "item_name"
    type = "S"
  }
}