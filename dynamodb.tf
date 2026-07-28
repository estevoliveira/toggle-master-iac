resource "aws_dynamodb_table" "events_table" {
  name         = "user-events"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "event_id"

  attribute {
    name = "event_id"
    type = "S"
  }

  tags = {
    Name = "user-events"
  }
}

resource "aws_iam_policy" "events_dynamodb_policy" {
  name        = "${var.project_name}-events-dynamodb-policy"
  description = "Allow EKS nodes to access DynamoDB user-events table"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Query",
          "dynamodb:Scan"
        ]
        Resource = aws_dynamodb_table.events_table.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "events_dynamodb_to_eks_nodes" {
  role       = local.eks_node_role_name
  policy_arn = aws_iam_policy.events_dynamodb_policy.arn
}
