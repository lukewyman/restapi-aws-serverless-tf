output "api_url" {
    value = aws_api_gateway_stage.api.invoke_url
}

output "todo_lists_table" {
    value = aws_dynamodb_table.todo_lists
}

output "todo_items_table" {
    value = aws_dynamodb_table.todo_items 
}