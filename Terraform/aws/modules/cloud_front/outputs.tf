output "s3_canonical_user_id" {
  value = aws_cloudfront_origin_access_identity.access_identity.s3_canonical_user_id
}