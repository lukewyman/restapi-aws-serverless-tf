# CREATE PROJECT

resource "aws_ecr_repository" "create_project" {
  name = "${local.prefix}-create-project"
}

resource "null_resource" "create_project_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/create_project/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/create_project/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/create_project/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/create_project
            docker build -t ${local.prefix}-create-project .
            docker tag ${local.prefix}-create-project ${aws_ecr_repository.create_project.repository_url}:1
            docker push ${aws_ecr_repository.create_project.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "create_project" {
  depends_on = [
    null_resource.create_project_state
  ]

  repository_name = aws_ecr_repository.create_project.name
  image_tag       = 1
}


# GET PROJECT

resource "aws_ecr_repository" "get_project" {
  name = "${local.prefix}-get-project"
}

resource "null_resource" "get_project_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/get_project/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/get_project/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/get_project/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/get_project
            docker build -t ${local.prefix}-get-project .
            docker tag ${local.prefix}-get-project ${aws_ecr_repository.get_project.repository_url}:1
            docker push ${aws_ecr_repository.get_project.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "get_project" {
  depends_on = [
    null_resource.get_project_state
  ]

  repository_name = aws_ecr_repository.get_project.name
  image_tag       = 1
}


# GET ALL PROJECTS

resource "aws_ecr_repository" "get_all_projects" {
  name = "${local.prefix}-get-all-projects"
}

resource "null_resource" "get_all_projects_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/get_all_projects/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/get_all_projects/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/get_all_projects/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/get_all_projects
            docker build -t ${local.prefix}-get-all-projects .
            docker tag ${local.prefix}-get-all-projects ${aws_ecr_repository.get_all_projects.repository_url}:1
            docker push ${aws_ecr_repository.get_all_projects.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "get_all_projects" {
  depends_on = [
    null_resource.get_all_projects_state
  ]

  repository_name = aws_ecr_repository.get_all_projects.name
  image_tag       = 1
}


# UPDATE PROJECT

resource "aws_ecr_repository" "update_project" {
  name = "${local.prefix}-update-project"
}

resource "null_resource" "update_project_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/update_project/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/update_project/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/update_project/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/update_project
            docker build -t ${local.prefix}-update-project .
            docker tag ${local.prefix}-update-project ${aws_ecr_repository.update_project.repository_url}:1
            docker push ${aws_ecr_repository.update_project.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "update_project" {
  depends_on = [
    null_resource.update_project_state
  ]

  repository_name = aws_ecr_repository.update_project.name
  image_tag       = 1
}


# DELETE PROJECT

resource "aws_ecr_repository" "delete_project" {
  name = "${local.prefix}-delete-project"
}

resource "null_resource" "delete_project_state" {
  triggers = {
    python_file = md5(file("${path.module}/../app/delete_project/lambda/function.py"))
    # requirements_file = md5(file("${path.module}/../app/delete_project/lambda/function.py"))
    docker_file = md5(file("${path.module}/../app/delete_project/Dockerfile"))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${path.module}/../app/delete_project
            docker build -t ${local.prefix}-delete-project .
            docker tag ${local.prefix}-delete-project ${aws_ecr_repository.delete_project.repository_url}:1
            docker push ${aws_ecr_repository.delete_project.repository_url}:1
        EOF
  }
}

data "aws_ecr_image" "delete_project" {
  depends_on = [
    null_resource.delete_project_state
  ]

  repository_name = aws_ecr_repository.delete_project.name
  image_tag       = 1
}