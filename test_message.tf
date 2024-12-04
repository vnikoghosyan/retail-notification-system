resource "null_resource" "publish_test_message" {
  provisioner "local-exec" {
    command = <<EOT
aws sns publish \
  --topic-arn "${aws_sns_topic.new_product_topic.arn}" \
  --message '{"ProductID": "65478912345", "Name": "Telcell Wireless Headphones", "Category": "Electronics", "Price": 99.99}'
EOT
  }
}
