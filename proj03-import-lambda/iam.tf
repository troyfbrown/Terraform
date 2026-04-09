import {
  to = aws_iam_role.lambda_execution_role
  id = "manually-created-lambda-role-uibb7hau"
}

import {
  to = aws_iam_policy.lambda_execution
  id = "arn:aws:iam::629066559449:policy/service-role/AWSLambdaBasicExecutionRole-f727636a-5080-4530-89fe-9b08860f634b"
}

data "aws_iam_policy_document" "assume_lambda_execution_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_policy" "lambda_execution" {
  name = "AWSLambdaBasicExecutionRole-f727636a-5080-4530-89fe-9b08860f634b"
  path = "/service-role/"
  policy = jsonencode({
    Statement = [{
      Action   = "logs:CreateLogGroup"
      Effect   = "Allow"
      Resource = "arn:aws:logs:us-east-1:629066559449:*"
      }, {
      Action   = ["logs:CreateLogStream", "logs:PutLogEvents"]
      Effect   = "Allow"
      Resource = ["arn:aws:logs:us-east-1:629066559449:log-group:/aws/lambda/manually-created-lambda:*"]
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role" "lambda_execution_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_lambda_execution_role.json
  name               = "manually-created-lambda-role-uibb7hau"
  path               = "/service-role/"
}

resource "aws_iam_role_policy_attachment" "lambda_execution" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_execution.arn
}