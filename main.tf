resource "aws_ecr_repository" "this" {
  name = var.ecr_name
}

resource "aws_ecr_repository_policy" "this" {
  repository = aws_ecr_repository.this.name

  policy = jsonencode({
    Version = "2008-10-17",
    Statement = [
      {
        Sid = "AllowPull",
        Effect = "Allow",
        Principal = {
            AWS = "arn:aws:iam::830701124395:root"
        }
        Action = [
            "ecr:BatchGetImage",
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchCheckLayerAvailability"
        ]
      }
    ]
  })
}