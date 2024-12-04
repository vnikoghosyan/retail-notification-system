resource "aws_cloudwatch_metric_alarm" "marketing_failure_alarm" {
  alarm_name          = "MarketingProcessorFailure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Triggered when MarketingProcessor Lambda fails."

  dimensions = {
    FunctionName = aws_lambda_function.marketing_processor.function_name
  }

  alarm_actions = [aws_sns_topic.alerts_topic.arn]
}

resource "aws_cloudwatch_metric_alarm" "inventory_failure_alarm" {
  alarm_name          = "InventoryProcessorFailure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Triggered when InventoryProcessor Lambda fails."

  dimensions = {
    FunctionName = aws_lambda_function.inventory_processor.function_name
  }

  alarm_actions = [aws_sns_topic.alerts_topic.arn]
}

resource "aws_cloudwatch_metric_alarm" "analytics_failure_alarm" {
  alarm_name          = "AnalyticsProcessorFailure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Triggered when AnalyticsProcessor Lambda fails."

  dimensions = {
    FunctionName = aws_lambda_function.analytics_processor.function_name
  }

  alarm_actions = [aws_sns_topic.alerts_topic.arn]
}
