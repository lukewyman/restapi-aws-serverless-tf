# CREATE TODO LIST

resource "aws_ecr_repository" "create_todo_list" {
  name = "${local.prefix}-create-todo-list"
}

resource "null_resource" "create_todo_list_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/create_todo_list/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/create_todo_list/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/create_todo_list/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/create_todo_list
            docker build -t ${local.prefix}-create-todo-list .
            docker tag ${local.prefix}-create-todo-list ${aws_ecr_repository.create_todo_list.repository_url}:1
            docker push ${aws_ecr_repository.create_todo_list.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "create_todo_list" {
  depends_on = [
    null_resource.create_todo_list_state
  ]

  repository_name = aws_ecr_repository.create_todo_list.name
  image_tag       = 1
}


# GET TODO LIST

resource "aws_ecr_repository" "get_todo_list" {
  name = "${local.prefix}-get-todo-list"
}

resource "null_resource" "get_todo_list_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/get_todo_list/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/get_todo_list/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/get_todo_list/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/get_todo_list
            docker build -t ${local.prefix}-get-todo-list .
            docker tag ${local.prefix}-get-todo-list ${aws_ecr_repository.get_todo_list.repository_url}:1
            docker push ${aws_ecr_repository.get_todo_list.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "get_todo_list" {
  depends_on = [
    null_resource.get_todo_list_state
  ]

  repository_name = aws_ecr_repository.get_todo_list.name
  image_tag       = 1
}


# # GET ALL PROJECTS

# resource "aws_ecr_repository" "get_all_todo_lists" {
#   name = "${local.prefix}-get-all-todo-lists"
# }

# resource "null_resource" "get_all_todo_lists_state" {
#   triggers = {
#     python_file = md5(file("${path.module}/../app/get_all_todo_lists/lambda/function.py"))
#     # requirements_file = md5(file("${path.module}/../app/get_all_todo_lists/lambda/function.py"))
#     docker_file = md5(file("${path.module}/../app/get_all_todo_lists/Dockerfile"))
#   }

#   provisioner "local-exec" {
#     command = <<EOF
#             aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
#             cd ${path.module}/../app/get_all_todo_lists
#             docker build -t ${local.prefix}-get-all-todo-lists .
#             docker tag ${local.prefix}-get-all-todo-lists ${aws_ecr_repository.get_all_todo_lists.repository_url}:1
#             docker push ${aws_ecr_repository.get_all_todo_lists.repository_url}:1
#         EOF
#   }
# }

# data "aws_ecr_image" "get_all_todo_lists" {
#   depends_on = [
#     null_resource.get_all_todo_lists_state
#   ]

#   repository_name = aws_ecr_repository.get_all_todo_lists.name
#   image_tag       = 1
# }


# # UPDATE PROJECT

# resource "aws_ecr_repository" "update_todo_list" {
#   name = "${local.prefix}-update-todo-list"
# }

# resource "null_resource" "update_todo_list_state" {
#   triggers = {
#     python_file = md5(file("${path.module}/../app/update_todo_list/lambda/function.py"))
#     # requirements_file = md5(file("${path.module}/../app/update_todo_list/lambda/function.py"))
#     docker_file = md5(file("${path.module}/../app/update_todo_list/Dockerfile"))
#   }

#   provisioner "local-exec" {
#     command = <<EOF
#             aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
#             cd ${path.module}/../app/update_todo_list
#             docker build -t ${local.prefix}-update-todo-list .
#             docker tag ${local.prefix}-update-todo-list ${aws_ecr_repository.update_todo_list.repository_url}:1
#             docker push ${aws_ecr_repository.update_todo_list.repository_url}:1
#         EOF
#   }
# }

# data "aws_ecr_image" "update_todo_list" {
#   depends_on = [
#     null_resource.update_todo_list_state
#   ]

#   repository_name = aws_ecr_repository.update_todo_list.name
#   image_tag       = 1
# }


# # DELETE PROJECT

# resource "aws_ecr_repository" "delete_todo_list" {
#   name = "${local.prefix}-delete-todo-list"
# }

# resource "null_resource" "delete_todo_list_state" {
#   triggers = {
#     python_file = md5(file("${path.module}/../app/delete_todo_list/lambda/function.py"))
#     # requirements_file = md5(file("${path.module}/../app/delete_todo_list/lambda/function.py"))
#     docker_file = md5(file("${path.module}/../app/delete_todo_list/Dockerfile"))
#   }

#   provisioner "local-exec" {
#     command = <<EOF
#             aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
#             cd ${path.module}/../app/delete_todo_list
#             docker build -t ${local.prefix}-delete-todo-list .
#             docker tag ${local.prefix}-delete-todo-list ${aws_ecr_repository.delete_todo_list.repository_url}:1
#             docker push ${aws_ecr_repository.delete_todo_list.repository_url}:1
#         EOF
#   }
# }

# data "aws_ecr_image" "delete_todo_list" {
#   depends_on = [
#     null_resource.delete_todo_list_state
#   ]

#   repository_name = aws_ecr_repository.delete_todo_list.name
#   image_tag       = 1
# }