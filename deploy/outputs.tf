# output "api_url" {
#     value = aws_api_gateway_stage.api.invoke_url
# }

output "todo_items_table_name" {
    value = aws_dynamodb_table.todo_items.name
}