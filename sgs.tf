# Define the SQS queues
resource "aws_sqs_queue" "marketing_queue" {
  name = "MarketingQueue"
}

resource "aws_sqs_queue" "inventory_queue" {
  name = "InventoryQueue"
}

resource "aws_sqs_queue" "analytics_queue" {
  name = "AnalyticsQueue"
}