resource "aws_iam_role" "lambda_role" {
  name = "${local.prefix}_lambda_role"

  assume_role_policy = file("${path.module}/iam_policies/assume-role-policy.json")
}

resource "aws_iam_role_policy" "lambda_logging_role_policy" {
  name = "${local.prefix}-logging-role-policy"
  role = aws_iam_role.lambda_role.id

  policy = file("${path.module}/iam_policies/lambda-logging-policy.json")
}
