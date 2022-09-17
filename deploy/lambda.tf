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