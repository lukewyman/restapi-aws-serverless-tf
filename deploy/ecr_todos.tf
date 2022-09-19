# CREATE TODO

resource "aws_ecr_repository" "create_todo_item" {
  name = "${local.prefix}-create-todo-item"
}

resource "null_resource" "create_todo_item_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/create_todo_item/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/create_todo_item/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/create_todo_item/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/create_todo_item
            docker build -t ${local.prefix}-create-todo-item .
            docker tag ${local.prefix}-create-todo-item ${aws_ecr_repository.create_todo_item.repository_url}:1
            docker push ${aws_ecr_repository.create_todo_item.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "create_todo_item" {
  depends_on = [
    null_resource.create_todo_item_state
  ]

  repository_name = aws_ecr_repository.create_todo_item.name
  image_tag       = 1
}


# # GET TODO

# resource "aws_ecr_repository" "get_todo" {
#   name = "${local.prefix}-get-todo"
# }

# resource "null_resource" "get_todo_state" {
#   triggers = {
#     python_file = md5(file("${path.module}/../app/get_todo/lambda/function.py"))
#     # requirements_file = md5(file("${path.module}/../app/get_todo/lambda/function.py"))
#     docker_file = md5(file("${path.module}/../app/get_todo/Dockerfile"))
#   }

#   provisioner "local-exec" {
#     command = <<EOF
#             aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
#             cd ${path.module}/../app/get_todo
#             docker build -t ${local.prefix}-get-todo .
#             docker tag ${local.prefix}-get-todo ${aws_ecr_repository.get_todo.repository_url}:1
#             docker push ${aws_ecr_repository.get_todo.repository_url}:1
#         EOF
#   }
# }

# data "aws_ecr_image" "get_todo" {
#   depends_on = [
#     null_resource.get_todo_state
#   ]

#   repository_name = aws_ecr_repository.get_todo.name
#   image_tag       = 1
# }


# GET ALL TODOS

resource "aws_ecr_repository" "get_all_todo_items" {
  name = "${local.prefix}-get-all-todos-items"
}

resource "null_resource" "get_all_todo_items_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/get_all_todo_items/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/get_all_todo_items/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/get_all_todo_items/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/get_all_todo_items
            docker build -t ${local.prefix}-get-all-todo-items .
            docker tag ${local.prefix}-get-all-todo-items ${aws_ecr_repository.get_all_todo_items.repository_url}:1
            docker push ${aws_ecr_repository.get_all_todo_items.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "get_all_todo_items" {
  depends_on = [
    null_resource.get_all_todo_items_state
  ]

  repository_name = aws_ecr_repository.get_all_todo_items.name
  image_tag       = 1
}


# # UPDATE TODO

# resource "aws_ecr_repository" "update_todo" {
#   name = "${local.prefix}-update-todo"
# }

# resource "null_resource" "update_todo_state" {
#   triggers = {
#     python_file = md5(file("${path.module}/../app/update_todo/lambda/function.py"))
#     # requirements_file = md5(file("${path.module}/../app/update_todo/lambda/function.py"))
#     docker_file = md5(file("${path.module}/../app/update_todo/Dockerfile"))
#   }

#   provisioner "local-exec" {
#     command = <<EOF
#             aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
#             cd ${path.module}/../app/update_todo
#             docker build -t ${local.prefix}-update-todo .
#             docker tag ${local.prefix}-update-todo ${aws_ecr_repository.update_todo.repository_url}:1
#             docker push ${aws_ecr_repository.update_todo.repository_url}:1
#         EOF
#   }
# }

# data "aws_ecr_image" "update_todo" {
#   depends_on = [
#     null_resource.update_todo_state
#   ]

#   repository_name = aws_ecr_repository.update_todo.name
#   image_tag       = 1
# }


# DELETE TODO

resource "aws_ecr_repository" "delete_todo_item" {
  name = "${local.prefix}-delete-todo"
}

resource "null_resource" "delete_todo_item_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/delete_todo_item/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/delete_todo_item/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/delete_todo_item/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/delete_todo_item
            docker build -t ${local.prefix}-delete-todo .
            docker tag ${local.prefix}-delete-todo ${aws_ecr_repository.delete_todo_item.repository_url}:1
            docker push ${aws_ecr_repository.delete_todo_item.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "delete_todo_item" {
  depends_on = [
    null_resource.delete_todo_item_state
  ]

  repository_name = aws_ecr_repository.delete_todo_item.name
  image_tag       = 1
}


# # PRIORITIZE TODO

# resource "aws_ecr_repository" "prioritize_todo" {
#   name = "${local.prefix}-prioritize-todo"
# }

# resource "null_resource" "prioritize_todo_state" {
#   triggers = {
#     python_file = md5(file("${path.module}/../app/prioritize_todo/lambda/function.py"))
#     # requirements_file = md5(file("${path.module}/../app/prioritize_todo/lambda/function.py"))
#     docker_file = md5(file("${path.module}/../app/prioritize_todo/Dockerfile"))
#   }

#   provisioner "local-exec" {
#     command = <<EOF
#             aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
#             cd ${path.module}/../app/prioritize_todo
#             docker build -t ${local.prefix}-prioritize-todo .
#             docker tag ${local.prefix}-prioritize-todo ${aws_ecr_repository.prioritize_todo.repository_url}:1
#             docker push ${aws_ecr_reposlogger.info()

#   repository_name = aws_ecr_repository.prioritize_todo.name
#   image_tag       = 1
# }