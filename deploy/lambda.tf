resource "aws_lambda_function" "create_project" {
  depends_on = [
    null_resource.create_project_state
  ]

  function_name = "${local.prefix}-create-project"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.create_project.repository_url}@${data.aws_ecr_image.create_project.id}"
  package_type  = "Image"

  environment {
    variables = {
      PROJECTS_TABLE_NAME = aws_dynamodb_table.projects.name
    }
  }
}

resource "aws_cloudwatch_log_group" "create_project" {
  name = "/aws/lambda/${aws_lambda_function.create_project.function_name}"
}

resource "aws_lambda_permission" "create_project" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_project.function_name
  principal     = "apigateway.amazonaws.com"
}


resource "aws_lambda_function" "get_project" {
  depends_on = [
    null_resource.get_project_state
  ]

  function_name = "${local.prefix}-get-project"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.get_project.repository_url}@${data.aws_ecr_image.get_project.id}"
  package_type  = "Image"
}

resource "aws_lambda_permission" "get_project" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_project.function_name
  principal     = "apigateway.amazonaws.com"
}


resource "aws_lambda_function" "get_all_projects" {
  depends_on = [
    null_resource.get_all_projects_state
  ]

  function_name = "${local.prefix}-get-all-projects"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.get_all_projects.repository_url}@${data.aws_ecr_image.get_all_projects.id}"
  package_type  = "Image"
}

resource "aws_lambda_permission" "get_all_projects" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_all_projects.function_name
  principal     = "apigateway.amazonaws.com"
}


resource "aws_lambda_function" "update_project" {
  depends_on = [
    null_resource.update_project_state
  ]

  function_name = "${local.prefix}-update-project"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.update_project.repository_url}@${data.aws_ecr_image.update_project.id}"
  package_type  = "Image"
}

resource "aws_lambda_permission" "update_project" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.update_project.function_name
  principal     = "apigateway.amazonaws.com"
}


resource "aws_lambda_function" "delete_project" {
  depends_on = [
    null_resource.delete_project_state
  ]

  function_name = "${local.prefix}-delete-project"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.delete_project.repository_url}@${data.aws_ecr_image.delete_project.id}"
  package_type  = "Image"
}

resource "aws_lambda_permission" "delete_project" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.delete_project.function_name
  principal     = "apigateway.amazonaws.com"
}


resource "aws_lambda_function" "create_todo" {
  depends_on = [
    null_resource.create_todo_state
  ]

  function_name = "${local.prefix}-create-todo"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.create_todo.repository_url}@${data.aws_ecr_image.create_todo.id}"
  package_type  = "Image"
}

resource "aws_cloudwatch_log_group" "create_todo" {
  name = "/aws/lambda/${aws_lambda_function.create_todo.function_name}"
}

resource "aws_lambda_permission" "create_todo" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_todo.function_name
  principal     = "apigateway.amazonaws.com"
}


# GET TODO

resource "aws_lambda_function" "get_todo" {
  depends_on = [
    null_resource.get_todo_state
  ]

  function_name = "${local.prefix}-get-todo"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.get_todo.repository_url}@${data.aws_ecr_image.get_todo.id}"
  package_type  = "Image"
}

resource "aws_cloudwatch_log_group" "get_todo" {
  name = "/aws/lambda/${aws_lambda_function.get_todo.function_name}"
}

resource "aws_lambda_permission" "get_todo" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_todo.function_name
  principal     = "apigateway.amazonaws.com"
}


# GET ALL TODOS

resource "aws_lambda_function" "get_all_todos" {
  depends_on = [
    null_resource.get_todo_state
  ]

  function_name = "${local.prefix}-get-all-todos"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.get_all_todos.repository_url}@${data.aws_ecr_image.get_all_todos.id}"
  package_type  = "Image"
}

resource "aws_cloudwatch_log_group" "get_all_todos" {
  name = "/aws/lambda/${aws_lambda_function.get_all_todos.function_name}"
}

resource "aws_lambda_permission" "get_all_todos" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_all_todos.function_name
  principal     = "apigateway.amazonaws.com"
}


# UPDATE TODO

resource "aws_lambda_function" "update_todo" {
  depends_on = [
    null_resource.update_todo_state
  ]

  function_name = "${local.prefix}-update-todo"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.update_todo.repository_url}@${data.aws_ecr_image.update_todo.id}"
  package_type  = "Image"
}

resource "aws_cloudwatch_log_group" "update_todo" {
  name = "/aws/lambda/${aws_lambda_function.update_todo.function_name}"
}

resource "aws_lambda_permission" "update_todo" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.update_todo.function_name
  principal     = "apigateway.amazonaws.com"
}


# DELETE TODO

resource "aws_lambda_function" "delete_todo" {
  depends_on = [
    null_resource.delete_todo_state
  ]

  function_name = "${local.prefix}-delete-todo"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.delete_todo.repository_url}@${data.aws_ecr_image.delete_todo.id}"
  package_type  = "Image"
}

resource "aws_cloudwatch_log_group" "delete_todo" {
  name = "/aws/lambda/${aws_lambda_function.delete_todo.function_name}"
}

resource "aws_lambda_permission" "delete_todo" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.delete_todo.function_name
  principal     = "apigateway.amazonaws.com"
}


# PRIORITIZE TODO

resource "aws_lambda_function" "prioritize_todo" {
  depends_on = [
    null_resource.delete_todo_state
  ]

  function_name = "${local.prefix}-prioritize-todo"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 300
  image_uri     = "${aws_ecr_repository.prioritize_todo.repository_url}@${data.aws_ecr_image.prioritize_todo.id}"
  package_type  = "Image"
}