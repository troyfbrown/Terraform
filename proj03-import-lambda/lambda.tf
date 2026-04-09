import {
  to = aws_lambda_function.this
  id = "manually-created-lambda"
}

resource "aws_lambda_function" "this" {
  description                        = "A starter AWS Lambda function."
  filename                           = null
  function_name                      = "manually-created-lambda"
  handler                            = "index.handler"
  role                               = "arn:aws:iam::629066559449:role/service-role/manually-created-lambda-role-uibb7hau"
  runtime                            = "nodejs22.x"
  
  tags = {
    "lambda-console:blueprint" = "hello-world"
  }

  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/manually-created-lambda"
  }
}