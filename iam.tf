resource "aws_iam_policy" "lambda_sqs_policy" {
  name        = "LambdaSQSAccessPolicy"
  description = "IAM policy to allow Lambda access to SQS queues and SNS publish"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        Resource = [
          aws_sqs_queue.marketing_queue.arn,
          aws_sqs_queue.inventory_queue.arn,
          aws_sqs_queue.analytics_queue.arn
        ]
      },
      {
        Effect   = "Allow",
        Action   = "sns:Publish",
        Resource = aws_sns_topic.new_product_topic.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_sqs_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_sqs_policy.arn
}
