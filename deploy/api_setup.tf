# resource "aws_api_gateway_rest_api" "api" {

#   name = "${local.prefix}-api"

#   endpoint_configuration {
#     types = ["REGIONAL"]
#   }
# }

# resource "aws_api_gateway_deployment" "api" {

#   depends_on = [
#     aws_api_gateway_method.post_todo_list,
#     aws_api_gateway_method.get_todo_list,
#     aws_api_gateway_method.get_all_todo_lists,
#     aws_api_gateway_method.update_todo_list,
#     # aws_api_gateway_method.delete_project,
#     aws_api_gateway_method.post_todo_item,
#     # aws_api_gateway_method.get_todo,
#     aws_api_gateway_method.get_all_todo_items,
#     # aws_api_gateway_method.update_todo,
#     aws_api_gateway_method.delete_todo_item
#   ]

#   rest_api_id = aws_api_gateway_rest_api.api.id

#   triggers = {

#     redeployment = sha1(jsonencode([
#       aws_api_gateway_resource.todo_lists,
#       aws_api_gateway_resource.todo_list,
#       #   aws_api_gateway_resource.todos,
#       #   aws_api_gateway_resource.todo,
#       aws_api_gateway_method.post_todo_list,
#       aws_api_gateway_integration.post_todo_list,
#       aws_api_gateway_method.get_all_todo_lists,
#       aws_api_gateway_integration.get_all_todo_lists,
#       aws_api_gateway_method.get_todo_list,
#       aws_api_gateway_integration.get_todo_list,
#       aws_api_gateway_method.update_todo_list,
#       aws_api_gateway_integration.update_todo_list,
#       #   aws_api_gateway_method.delete_project,
#       #   aws_api_gateway_integration.delete_project,
#       aws_api_gateway_method.post_todo_item,
#       aws_api_gateway_integration.post_todo_item,
#       aws_api_gateway_method.get_todo_item,
#       #   aws_api_gateway_integration.get_todo,
#         aws_api_gateway_method.get_all_todo_items,
#         aws_api_gateway_integration.get_all_todo_items,
#       #   aws_api_gateway_method.update_todo,
#       #   aws_api_gateway_integration.update_todo,
#       aws_api_gateway_method.delete_todo_item,
#       aws_api_gateway_integration.delete_todo_item
#     ]))
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_cloudwatch_log_group" "api" {
#   name = "/aws/api_gw/${local.prefix}-api"
# }

# resource "aws_api_gateway_stage" "api" {
#   deployment_id = aws_api_gateway_deployment.api.id
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   stage_name    = terraform.workspace

#   access_log_settings {
#     destination_arn = aws_cloudwatch_log_group.api.arn

#     format = jsonencode({
#       requestId               = "$context.requestId"
#       sourceIp                = "$context.identity.sourceIp"
#       requestTime             = "$context.requestTime"
#       protocol                = "$context.protocol"
#       httpMethod              = "$context.httpMethod"
#       resourcePath            = "$context.resourcePath"
#       routeKey                = "$context.routeKey"
#       status                  = "$context.status"
#       responseLength          = "$context.responseLength"
#       integrationErrorMessage = "$context.integrationErrorMessage"
#     })
#   }
# }
