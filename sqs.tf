resource "aws_sqs_queue" "feature_evaluation_events" {
  name = "feature-evaluation-events"

  visibility_timeout_seconds = 30

  message_retention_seconds = 345600

  receive_wait_time_seconds = 20
}