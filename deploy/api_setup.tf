resource "aws_api_gateway_rest_api" "api" {

  name = "${local.prefix}-api"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "api" {

  depends_on = [
    aws_api_gateway_method.post_project,
    aws_api_gateway_method.get_project,
    aws_api_gateway_method.get_all_projects,
    aws_api_gateway_method.update_project,
    aws_api_gateway_method.delete_project
  ]

  rest_api_id = aws_api_gateway_rest_api.api.id

  triggers = {

    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.projects,
      aws_api_gateway_method.post_project,
      aws_api_gateway_integration.post_project,
      aws_api_gateway_method.get_all_projects,
      aws_api_gateway_integration.get_all_projects,
      aws_api_gateway_resource.project,
      aws_api_gateway_method.get_project,
      aws_api_gateway_integration.get_project,
      aws_api_gateway_method.update_project,
      aws_api_gateway_integration.update_project,
      aws_api_gateway_method.delete_project,
      aws_api_gateway_integration.delete_project
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_log_group" "api" {
  name = "/aws/api_gw/${local.prefix}-api"
}

resource "aws_api_gateway_stage" "api" {
  deployment_id = aws_api_gateway_deployment.api.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = "${local.prefix}-api-stage"

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
