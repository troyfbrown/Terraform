import {
  to = aws_iam_role.lambda_execution_role
  id = "manually-created-lambda-role-uibb7hau"
}

resource "aws_iam_role" "lambda_execution_role" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  managed_policy_arns = ["arn:aws:iam::629066559449:policy/service-role/AWSLambdaBasicExecutionRole-f727636a-5080-4530-89fe-9b08860f634b"]
  name                = "manually-created-lambda-role-uibb7hau"
  path                = "/service-role/"
}