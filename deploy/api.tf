resource "aws_api_gateway_rest_api" "api" {
  name = "${local.prefix}-api"
}

resource "aws_api_gateway_stage" "api" {
    deployment_id = aws_api_gateway_deployment.api.id 
    rest_api_id = aws_api_gateway_rest_api.api.id 
    stage_name = "${local.prefix}-api-stage"

    access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api.arn

    format = jsonencode({
      requestId               = "$context.requestId"
      sourceIp                = "$context.identity.sourceIp"
      requestTime             = "$context.requestTime"
      protocol                = "$context.protocol"
      httpMethod              = "$context.httpMethod"
      resourcePath            = "$context.resourcePath"
      routeKey                = "$context.routeKey"
      status                  = "$context.status"
      responseLength          = "$context.responseLength"
      integrationErrorMessage = "$context.integrationErrorMessage"
    })
  }
}

resource "aws_api_gateway_resource" "todo" {
  path_part   = "todos"
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_method" "post_todo" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.todo.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_todo" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.todo.id
  http_method = aws_api_gateway_method.post_todo.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.create_todo.invoke_arn
}

resource "aws_lambda_permission" "create_todo" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_todo.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_api_gateway_deployment" "api" {
    rest_api_id = aws_api_gateway_rest_api.api.id 
}

resource "aws_cloudwatch_log_group" "api" {
    name = "/aws/api_gw/${local.prefix}-api"
}

