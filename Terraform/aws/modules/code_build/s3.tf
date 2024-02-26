resource "aws_s3_bucket" "codebuild_bucket" {
  bucket = "${var.project}-${var.environment}-codebuild-bucket"
}