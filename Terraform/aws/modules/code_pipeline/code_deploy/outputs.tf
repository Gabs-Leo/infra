output "bucket_arn" {
  value = aws_s3_bucket.codepipeline_artifact_store.arn
}