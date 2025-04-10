provider "aws" {
  region = "us-east-1"
}

resource "aws_guardduty_detector" "main" {
  enable = true
}

resource "aws_cloudwatch_event_rule" "guardduty_finding" {
  name        = "guardduty-finding-rule"
  description = "Triggers Lambda on GuardDuty findings"
  event_pattern = jsonencode({
    source = ["aws.guardduty"],
    "detail-type" = ["GuardDuty Finding"]
  })
}

resource "aws_cloudwatch_event_target" "target_lambda" {
  rule      = aws_cloudwatch_event_rule.guardduty_finding.name
  target_id = "LambdaTarget"
  arn       = aws_lambda_function.guardduty_responder.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.guardduty_responder.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.guardduty_finding.arn
}
