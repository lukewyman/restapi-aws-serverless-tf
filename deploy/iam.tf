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

