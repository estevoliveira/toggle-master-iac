data "aws_iam_policy_document" "evaluation_sqs_send" {
  statement {
    effect = "Allow"

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:ChangeMessageVisibility",
      "sqs:GetQueueUrl",
      "sqs:GetQueueAttributes"
    ]

    resources = [
      aws_sqs_queue.feature_evaluation_events.arn
    ]
  }
}

resource "aws_iam_role_policy" "eks_node_sqs_send" {
  name = "evaluation-service-sqs-send"

  role = local.eks_node_role_name

  policy = data.aws_iam_policy_document.evaluation_sqs_send.json
}