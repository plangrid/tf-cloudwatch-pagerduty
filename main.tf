# Generate a random id
resource "random_id" "topic_id" {
  byte_length = 4  # This will create a 8-character hexadecimal string
}

# Define the SNS topic
resource "aws_sns_topic" "pagerduty_topic" {
  name = "pagerduty_topic_${random_id.topic_id.hex}"
}

# Define the SNS topic subscription to PagerDuty
resource "aws_sns_topic_subscription" "pagerduty_subscription" {
  topic_arn = aws_sns_topic.pagerduty_topic.arn
  protocol  = "https"
  endpoint  = "https://events.pagerduty.com/integration/d55f58297cf8420fc0a780e7b7fa43bd/enqueue"
}
