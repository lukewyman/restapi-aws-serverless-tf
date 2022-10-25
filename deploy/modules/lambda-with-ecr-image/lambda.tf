resource "aws_iam_role" "lambda_role" {
  name = "${var.function_name}-lambda-role"

  assume_role_policy = file("./iam_policies/assume-role-policy.json")
}

resource "aws_iam_role_policy" "lambda_logging_role_policy" {
  name = "${var.function_name}-logging-role-policy"
  role = aws_iam_role.lambda_role.id

  policy = file("./iam_policies/lambda-logging-policy.json")
}


resource "aws_lambda_function" "lambda_function" {
  depends_on = [
    data.aws_ecr_image.ecr_image
  ]

  function_name = "${var.function_name}"
  role          = aws_iam_role.lambda_role.arn
  timeout       = var.timeout
  image_uri     = "${aws_ecr_repository.ecr_repository.repository_url}@${data.aws_ecr_image.ecr_image.id}"
  package_type  = "Image"

  environment {
    variables = var.environment_variables
  }
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda/${var.function_name}"
}

resource "aws_lambda_permission" "lambda_apigw_permission" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
}