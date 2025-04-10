resource "aws_lambda_function" "guardduty_responder" {
  function_name = "guardduty_responder"
  role          = aws_iam_role.lambda_guardduty_role.arn
  handler       = "lambda.ps1"
  runtime       = "dotnet6"  # Required for PowerShell on Lambda

  filename         = "${path.module}/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda.zip")

  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
}
