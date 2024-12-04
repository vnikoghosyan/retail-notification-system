resource "aws_sns_topic" "alerts_topic" {
  name = "LambdaAlertsTopic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alerts_topic.arn
  protocol  = "email"
  endpoint  = "vnikoghosyan@gmail.com" # Replace with your email address
}
