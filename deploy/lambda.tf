module "lambda_create_todo_list" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-create-todo-list"
  timeout = 300
  docker_dir = "${path.module}/../app/create_todo_list"
  function_dir = "${path.module}/../app/create_todo_list/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "create_todo_list_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_create_todo_list.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}

# resource "aws_lambda_permission" "create_todo_list" {
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.create_todo_list.function_name
#   principal     = "apigateway.amazonaws.com"
# }


module "lambda_get_todo_list" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-get-todo-list"
  timeout = 300
  docker_dir = "${path.module}/../app/get_todo_list"
  function_dir = "${path.module}/../app/get_todo_list/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "get_todo_list_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_get_todo_list.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}


module "lambda_get_all_todo_lists" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-get-all-todo-lists"
  timeout = 300
  docker_dir = "${path.module}/../app/get_all_todo_lists"
  function_dir = "${path.module}/../app/get_all_todo_lists/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "get_all_todo_lists_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_get_all_todo_lists.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}


module "lambda_update_todo_list" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-update-todo-list"
  timeout = 300
  docker_dir = "${path.module}/../app/update_todo_list"
  function_dir = "${path.module}/../app/update_todo_list/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "update_todo_list_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_update_todo_list.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}


module "lambda_delete_todo_list" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-delete-todo-list"
  timeout = 300
  docker_dir = "${path.module}/../app/delete_todo_list"
  function_dir = "${path.module}/../app/delete_todo_list/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "delete_todo_list_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_delete_todo_list.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}


module "lambda_create_todo_item" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-create-todo-item"
  timeout = 300
  docker_dir = "${path.module}/../app/create_todo_item"
  function_dir = "${path.module}/../app/create_todo_item/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "create_todo_item_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_create_todo_item.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}


module "lambda_get_todo_item" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-get-todo-item"
  timeout = 300
  docker_dir = "${path.module}/../app/get_todo_item"
  function_dir = "${path.module}/../app/get_todo_item/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "get_todo_item_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_get_todo_item.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}


module "lambda_get_all_todo_items" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-get-all-todo-items"
  timeout = 300
  docker_dir = "${path.module}/../app/get_all_todo_items"
  function_dir = "${path.module}/../app/get_all_todo_items/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "get_all_todo_items_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_get_all_todo_items.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}


module "lambda_update_todo_item" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-update-todo-item"
  timeout = 300
  docker_dir = "${path.module}/../app/update_todo_item"
  function_dir = "${path.module}/../app/update_todo_item/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "update_todo_item_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_update_todo_item.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}


module "lambda_delete_todo_item" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-delete-todo-item"
  timeout = 300
  docker_dir = "${path.module}/../app/delete_todo_item"
  function_dir = "${path.module}/../app/delete_todo_item/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "delete_todo_item_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_delete_todo_item.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}


module "lambda_prioritize_todo_item" {
  source = "./modules/lambda-with-ecr-image"

  region = var.region 
  function_name = "${local.prefix}-prioritize-todo-item"
  timeout = 300
  docker_dir = "${path.module}/../app/prioritize_todo_item"
  function_dir = "${path.module}/../app/prioritize_todo_item/lambda"
  image_tag = 1

  environment_variables = {
      TODO_LISTS_TABLE_NAME = aws_dynamodb_table.todo_lists.name
    }
}

resource "aws_iam_policy_attachment" "prioritize_todo_item_dynamodb_policy_attachment" {
  name       = "${local.prefix}-dynamodb-policy-attachment"
  roles      = [module.lambda_prioritize_todo_item.lambda_role_name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}
