# # POST TODO LIST

# resource "aws_api_gateway_method" "post_todo_list" {

#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo_lists.id
#   http_method   = "POST"
#   authorization = "NONE"
#   request_models = {
#     "application/json" = aws_api_gateway_model.todo_list.name
#   }
#   request_validator_id = aws_api_gateway_request_validator.todo_list.id
# }

# resource "aws_api_gateway_integration" "post_todo_list" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo_lists.id
#   http_method = aws_api_gateway_method.post_todo_list.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.create_todo_list.invoke_arn
# }


# # GET TODO LIST

# resource "aws_api_gateway_method" "get_todo_list" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo_list.id
#   http_method   = "GET"
#   authorization = "NONE"

#   request_parameters = {
#     "method.request.path.projectId" = true
#   }
# }

# resource "aws_api_gateway_integration" "get_todo_list" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo_list.id
#   http_method = aws_api_gateway_method.get_todo_list.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.get_todo_list.invoke_arn
# }


# # GET ALL TODO LISTS

# resource "aws_api_gateway_method" "get_all_todo_lists" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo_lists.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "get_all_todo_lists" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo_lists.id
#   http_method = aws_api_gateway_method.get_all_todo_lists.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.get_all_todo_lists.invoke_arn
# }


# # UPDATE TODO LIST

# resource "aws_api_gateway_method" "update_todo_list" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo_list.id
#   http_method   = "PUT"
#   authorization = "NONE"

#   request_parameters = {
#     "method.request.path.todoListId" = true
#   }
# }

# resource "aws_api_gateway_integration" "update_todo_list" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo_list.id
#   http_method = aws_api_gateway_method.update_todo_list.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.update_todo_list.invoke_arn
# }


# # # DELETE PROJECT

# # resource "aws_api_gateway_method" "delete_project" {
# #   rest_api_id   = aws_api_gateway_rest_api.api.id
# #   resource_id   = aws_api_gateway_resource.project.id
# #   http_method   = "DELETE"
# #   authorization = "NONE"

# #   request_parameters = {
# #     "method.request.path.projectId" = true
# #   }
# # }

# # resource "aws_api_gateway_integration" "delete_project" {
# #   rest_api_id = aws_api_gateway_rest_api.api.id
# #   resource_id = aws_api_gateway_resource.project.id
# #   http_method = aws_api_gateway_method.delete_project.http_method

# #   integration_http_method = "POST"
# #   type                    = "AWS_PROXY"
# #   uri                     = aws_lambda_function.delete_project.invoke_arn
# # }


# # POST TODO ITEM

# resource "aws_api_gateway_method" "post_todo_item" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo_items.id
#   http_method   = "POST"
#   authorization = "NONE"

#   request_models = {
#     "application/json" = aws_api_gateway_model.todo_item.name
#   }
#   request_validator_id = aws_api_gateway_request_validator.todo_item.id

#   request_parameters = {
#     "method.request.path.todoListId" = true
#   }
# }

# resource "aws_api_gateway_integration" "post_todo_item" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo_items.id
#   http_method = aws_api_gateway_method.post_todo_item.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.create_todo_item.invoke_arn
# }


# # GET TODO

# resource "aws_api_gateway_method" "get_todo_item" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo_item.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "get_todo_item" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo_item.id
#   http_method = aws_api_gateway_method.get_todo_item.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.get_todo_item.invoke_arn
# }


# # GET ALL TODO ITEMS

# resource "aws_api_gateway_method" "get_all_todo_items" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo_items.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "get_all_todo_items" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo_items.id
#   http_method = aws_api_gateway_method.get_all_todo_items.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.get_all_todo_items.invoke_arn
# }


# # # UPDATE TODO

# # resource "aws_api_gateway_method" "update_todo" {
# #   rest_api_id   = aws_api_gateway_rest_api.api.id
# #   resource_id   = aws_api_gateway_resource.todo.id
# #   http_method   = "PUT"
# #   authorization = "NONE"
# # }

# # resource "aws_api_gateway_integration" "update_todo" {
# #   rest_api_id = aws_api_gateway_rest_api.api.id
# #   resource_id = aws_api_gateway_resource.todo.id
# #   http_method = aws_api_gateway_method.update_todo.http_method

# #   integration_http_method = "POST"
# #   type                    = "AWS_PROXY"
# #   uri                     = aws_lambda_function.update_todo.invoke_arn
# # }


# # DELETE TODO

# resource "aws_api_gateway_method" "delete_todo_item" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo_item.id
#   http_method   = "DELETE"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "delete_todo_item" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo_item.id
#   http_method = aws_api_gateway_method.delete_todo_item.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.delete_todo_item.invoke_arn
# }