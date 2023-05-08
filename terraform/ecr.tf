resource "aws_ecr_repository" "ecr_repo" {
  name = var.name
}

resource "aws_ecr_repository_policy" "ecr-repo" {
  repository = aws_ecr_repository.ecr_repo.name

  policy = jsonencode({
    Version = "2008-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ]
      }
    ]
  })
}