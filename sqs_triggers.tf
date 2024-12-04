resource "aws_lambda_event_source_mapping" "marketing_trigger" {
  event_source_arn = aws_sqs_queue.marketing_queue.arn
  function_name    = aws_lambda_function.marketing_processor.arn
  batch_size       = 5
  enabled          = true
}

resource "aws_lambda_event_source_mapping" "inventory_trigger" {
  event_source_arn = aws_sqs_queue.inventory_queue.arn
  function_name    = aws_lambda_function.inventory_processor.arn
  batch_size       = 5
  enabled          = true
}

resource "aws_lambda_event_source_mapping" "analytics_trigger" {
  event_source_arn = aws_sqs_queue.analytics_queue.arn
  function_name    = aws_lambda_function.analytics_processor.arn
  batch_size       = 5
  enabled          = true
}
