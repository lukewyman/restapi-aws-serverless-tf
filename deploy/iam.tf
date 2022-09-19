resource "aws_iam_role" "lambda_role" {
  name = "${local.prefix}_lambda_role"

  assume_role_policy = file("${path.module}/iam_policies/assume-role-policy.json")
}

resource "aws_iam_role_policy" "lambda_logging_role_policy" {
  name = "${local.prefix}-logging-role-policy"
  role = aws_iam_role.lambda_role.id

  policy = file("${path.module}/iam_policies/lambda-logging-policy.json")
}

resource "aws_iam_policy" "dynamodb_policy" {
  name = "${local.prefix}-dynamodb-policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Action" : [
        "dynamodb:BatchGetItem",
        "dynamodb:GetItem",
        "dynamodb:Get*",
        "dynamodb:Query",
        "dynamodb:Scan",
        "dynamodb:BatchWriteItem",
        "dynamodb:PutItem",
        "dynamodb:UpdateItem",
        "dynamodb:DeleteItem",
        "dynamodb:GetShardIterator",
        "dynamodb:DescribeStream",
        "dynamodb:ListStreams",
        "dynamodb:ListShards",
        "dynamodb:GetRecords"
      ],
      "Resource" : [
        "${aws_dynamodb_table.todo_lists.arn}",
        "${aws_dynamodb_table.todo_lists.arn}/*",
        "${aws_dynamodb_table.todo_items.arn}",
        "${aws_dynamodb_table.todo_items.arn}/*",
      ]
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}