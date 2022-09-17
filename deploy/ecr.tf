# CREATE TODO

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


# GET TODO

resource "aws_ecr_repository" "get_todo" {
    name = "${local.prefix}-get-todo"
}

resource "null_resource" "get_todo_state" {
    triggers = {
        python_file = md5(file("${path.module}/../app/get_todo/lambda/function.py"))
        # requirements_file = md5(file("${path.module}/../app/get_todo/lambda/function.py"))
        docker_file = md5(file("${path.module}/../app/get_todo/Dockerfile"))
    }

    provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/get_todo
            docker build -t ${local.prefix}-get-todo .
            docker tag ${local.prefix}-get-todo ${aws_ecr_repository.get_todo.repository_url}:1
            docker push ${aws_ecr_repository.get_todo.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "get_todo" {
  depends_on = [
    null_resource.get_todo_state
  ]

  repository_name = aws_ecr_repository.get_todo.name
  image_tag       = 1
}


# GET ALL TODOS

resource "aws_ecr_repository" "get_all_todos" {
    name = "${local.prefix}-get-all-todos"
}

resource "null_resource" "get_all_todos_state" {
    triggers = {
        python_file = md5(file("${path.module}/../app/get_all_todos/lambda/function.py"))
        # requirements_file = md5(file("${path.module}/../app/get_all_todos/lambda/function.py"))
        docker_file = md5(file("${path.module}/../app/get_all_todos/Dockerfile"))
    }

    provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/get_all_todos
            docker build -t ${local.prefix}-get-all-todos .
            docker tag ${local.prefix}-get-all-todos ${aws_ecr_repository.get_all_todos.repository_url}:1
            docker push ${aws_ecr_repository.get_all_todos.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "get_all_todos" {
  depends_on = [
    null_resource.get_all_todos_state
  ]

  repository_name = aws_ecr_repository.get_all_todos.name
  image_tag       = 1
}


# UPDATE TODO

resource "aws_ecr_repository" "update_todo" {
    name = "${local.prefix}-update-todo"
}

resource "null_resource" "update_todo_state" {
    triggers = {
        python_file = md5(file("${path.module}/../app/update_todo/lambda/function.py"))
        # requirements_file = md5(file("${path.module}/../app/update_todo/lambda/function.py"))
        docker_file = md5(file("${path.module}/../app/update_todo/Dockerfile"))
    }

    provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/update_todo
            docker build -t ${local.prefix}-update-todo .
            docker tag ${local.prefix}-update-todo ${aws_ecr_repository.update_todo.repository_url}:1
            docker push ${aws_ecr_repository.update_todo.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "update_todo" {
  depends_on = [
    null_resource.update_todo_state
  ]

  repository_name = aws_ecr_repository.update_todo.name
  image_tag       = 1
}


# DELETE TODO

resource "aws_ecr_repository" "delete_todo" {
    name = "${local.prefix}-delete-todo"
}

resource "null_resource" "delete_todo_state" {
    triggers = {
        python_file = md5(file("${path.module}/../app/delete_todo/lambda/function.py"))
        # requirements_file = md5(file("${path.module}/../app/delete_todo/lambda/function.py"))
        docker_file = md5(file("${path.module}/../app/delete_todo/Dockerfile"))
    }

    provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/delete_todo
            docker build -t ${local.prefix}-delete-todo .
            docker tag ${local.prefix}-delete-todo ${aws_ecr_repository.delete_todo.repository_url}:1
            docker push ${aws_ecr_repository.delete_todo.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "delete_todo" {
  depends_on = [
    null_resource.delete_todo_state
  ]

  repository_name = aws_ecr_repository.delete_todo.name
  image_tag       = 1
}


# PRIORITIZE TODO

resource "aws_ecr_repository" "prioritize_todo" {
    name = "${local.prefix}-prioritize-todo"
}

resource "null_resource" "prioritize_todo_state" {
    triggers = {
        python_file = md5(file("${path.module}/../app/prioritize_todo/lambda/function.py"))
        # requirements_file = md5(file("${path.module}/../app/prioritize_todo/lambda/function.py"))
        docker_file = md5(file("${path.module}/../app/prioritize_todo/Dockerfile"))
    }

    provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/prioritize_todo
            docker build -t ${local.prefix}-prioritize-todo .
            docker tag ${local.prefix}-prioritize-todo ${aws_ecr_repository.prioritize_todo.repository_url}:1
            docker push ${aws_ecr_repository.prioritize_todo.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "prioritize_todo" {
  depends_on = [
    null_resource.prioritize_todo_state
  ]

  repository_name = aws_ecr_repository.prioritize_todo.name
  image_tag       = 1
}