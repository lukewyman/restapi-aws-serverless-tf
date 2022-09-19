# # REST RESOURCES

# resource "aws_api_gateway_resource" "projects" {
#   path_part   = "projects"
#   parent_id   = aws_api_gateway_rest_api.api.root_resource_id
#   rest_api_id = aws_api_gateway_rest_api.api.id
# }

# resource "aws_api_gateway_resource" "project" {
#   path_part   = "{projectId}"
#   parent_id   = aws_api_gateway_resource.projects.id
#   rest_api_id = aws_api_gateway_rest_api.api.id
# }

# resource "aws_api_gateway_resource" "todos" {
#   path_part   = "todos"
#   parent_id   = aws_api_gateway_resource.project.id
#   rest_api_id = aws_api_gateway_rest_api.api.id
# }

# resource "aws_api_gateway_resource" "todo" {
#   path_part   = "{todoId}"
#   parent_id   = aws_api_gateway_resource.todos.id
#   rest_api_id = aws_api_gateway_rest_api.api.id
# }


# # POST PROJECT

# resource "aws_api_gateway_method" "post_project" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.projects.id
#   http_method   = "POST"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "post_project" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.projects.id
#   http_method = aws_api_gateway_method.post_project.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.create_project.invoke_arn
# }


# # GET PROJECT

# resource "aws_api_gateway_method" "get_project" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.project.id
#   http_method   = "GET"
#   authorization = "NONE"

#   request_parameters = {
#     "method.request.path.projectId" = true
#   }
# }

# resource "aws_api_gateway_integration" "get_project" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.project.id
#   http_method = aws_api_gateway_method.get_project.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.get_project.invoke_arn
# }


# # GET ALL PROJECTS

# resource "aws_api_gateway_method" "get_all_projects" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.projects.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "get_all_projects" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.projects.id
#   http_method = aws_api_gateway_method.get_all_projects.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.get_all_projects.invoke_arn
# }


# # UPDATE PROJECT

# resource "aws_api_gateway_method" "update_project" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.project.id
#   http_method   = "PUT"
#   authorization = "NONE"

#   request_parameters = {
#     "method.request.path.projectId" = true
#   }
# }

# resource "aws_api_gateway_integration" "update_project" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.project.id
#   http_method = aws_api_gateway_method.update_project.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.update_project.invoke_arn
# }


# # DELETE PROJECT

# resource "aws_api_gateway_method" "delete_project" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.project.id
#   http_method   = "DELETE"
#   authorization = "NONE"

#   request_parameters = {
#     "method.request.path.projectId" = true
#   }
# }

# resource "aws_api_gateway_integration" "delete_project" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.project.id
#   http_method = aws_api_gateway_method.delete_project.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.delete_project.invoke_arn
# }


# # POST TODO

# resource "aws_api_gateway_method" "post_todo" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todos.id
#   http_method   = "POST"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "post_todo" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todos.id
#   http_method = aws_api_gateway_method.post_todo.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.create_todo.invoke_arn
# }


# # GET TODO

# resource "aws_api_gateway_method" "get_todo" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "get_todo" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo.id
#   http_method = aws_api_gateway_method.get_todo.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.get_todo.invoke_arn
# }


# # GET ALL TODOS

# resource "aws_api_gateway_method" "get_all_todos" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todos.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "get_all_todos" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todos.id
#   http_method = aws_api_gateway_method.get_all_todos.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.get_all_todos.invoke_arn
# }


# # UPDATE TODO

# resource "aws_api_gateway_method" "update_todo" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo.id
#   http_method   = "PUT"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "update_todo" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo.id
#   http_method = aws_api_gateway_method.update_todo.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.update_todo.invoke_arn
# }


# # DELETE TODO

# resource "aws_api_gateway_method" "delete_todo" {
#   rest_api_id   = aws_api_gateway_rest_api.api.id
#   resource_id   = aws_api_gateway_resource.todo.id
#   http_method   = "DELETE"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "delete_todo" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_resource.todo.id
#   http_method = aws_api_gateway_method.delete_todo.http_method

#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.delete_todo.invoke_arn
# }