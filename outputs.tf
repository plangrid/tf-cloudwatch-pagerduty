
 

output "sns_topic_arn" {
  value = aws_sns_topic.pagerduty_topic.arn
}

output "sns_topic_name" {
  value = aws_sns_topic.pagerduty_topic.name
}