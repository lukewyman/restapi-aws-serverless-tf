output "image_uri" {
    value = "${aws_ecr_repository.ecr_repository.repository_url}@${data.aws_ecr_image.ecr_image.id}"
}