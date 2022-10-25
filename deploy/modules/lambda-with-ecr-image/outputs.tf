output "image_uri" {
    value = "${aws_ecr_repository.ecr_repository.repository_url}@${data.aws_ecr_image.ecr_image.id}"
}

output "lambda_role_name" {
    value = aws_iam_role.lambda_role.name
}

output "lambda_role_arn" {
    value = aws_iam_role.lambda_role.arn
}

output "invoke_arn" {
    value = aws_lambda_function.lambda_function.invoke_arn 
}
