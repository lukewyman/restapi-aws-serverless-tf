resource "aws_ecr_repository" "create_todo" {
  name = "${local.prefix}-create-todo"
}

resource "null_resource" "create_todo_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/create_todo/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/create_todo/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/create_todo/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/create_todo
            docker build -t ${local.prefix}-create-todo .
            docker tag ${local.prefix}-create-todo ${aws_ecr_repository.create_todo.repository_url}:1
            docker push ${aws_ecr_repository.create_todo.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "create_todo" {
  depends_on = [
    null_resource.create_todo_state
  ]

  repository_name = aws_ecr_repository.create_todo.name
  image_tag       = 1
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