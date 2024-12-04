# IAM Role for Lambda Functions
resource "aws_iam_role" "lambda_role" {
  name = "lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# IAM Policy for Lambda Permissions
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


# Lambda Function: MarketingProcessor
resource "aws_lambda_function" "marketing_processor" {
  function_name = "MarketingProcessor"
  runtime       = "python3.9"
  handler       = "marketing_processor.lambda_handler"
  role          = aws_iam_role.lambda_role.arn

  source_code_hash = filebase64sha256("lambda/marketing_processor.py")
  filename         = "lambda/marketing_processor.py.zip"
}

# Lambda Function: InventoryProcessor
resource "aws_lambda_function" "inventory_processor" {
  function_name = "InventoryProcessor"
  runtime       = "python3.9"
  handler       = "inventory_processor.lambda_handler"
  role          = aws_iam_role.lambda_role.arn

  source_code_hash = filebase64sha256("lambda/inventory_processor.py")
  filename         = "lambda/inventory_processor.py.zip"
}

# Lambda Function: AnalyticsProcessor
resource "aws_lambda_function" "analytics_processor" {
  function_name = "AnalyticsProcessor"
  runtime       = "python3.9"
  handler       = "analytics_processor.lambda_handler"
  role          = aws_iam_role.lambda_role.arn

  source_code_hash = filebase64sha256("lambda/analytics_processor.py")
  filename         = "lambda/analytics_processor.py.zip"
}