# # REST RESOURCES

resource "aws_api_gateway_resource" "todo_lists" {
  path_part   = "todo-lists"
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_resource" "todo_list" {
  path_part   = "{listName}"
  parent_id   = aws_api_gateway_resource.todo_lists.id
  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_resource" "todo_items" {
  path_part   = "todo-items"
  parent_id   = aws_api_gateway_resource.todo_list.id
  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_resource" "todo_item" {
  path_part   = "{itemName}"
  parent_id   = aws_api_gateway_resource.todo_items.id
  rest_api_id = aws_api_gateway_rest_api.api.id
}