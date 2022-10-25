data "aws_caller_identity" "current" {}

resource "aws_ecr_repository" "ecr_repository" {
  name = var.function_name
}

resource "null_resource" "ecr_image_state" {
  triggers = {
    dir_md5 = md5(join("", [for f in fileset("${var.function_dir}", "*"): filemd5("${var.function_dir}/${f}")]))
  }

  provisioner "local-exec" {
    command = <<EOF
            aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com
            cd ${var.docker_dir}
            docker build -t ${var.function_name} .
            docker tag ${var.function_name} ${aws_ecr_repository.ecr_repository.repository_url}:${var.image_tag}
            docker push ${aws_ecr_repository.ecr_repository.repository_url}:${var.image_tag}
        EOF
  }
}

data "aws_ecr_image" "ecr_image" {
  depends_on = [
    null_resource.ecr_image_state
  ]

  repository_name = aws_ecr_repository.ecr_repository.name
  image_tag       = var.image_tag
}