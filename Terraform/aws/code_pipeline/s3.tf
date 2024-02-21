resource "aws_s3_bucket" "codepipeline_artifact_store" {
  bucket = "${var.project}-${var.environment}-codepipeline-artifacts"
}