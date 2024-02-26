resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.app_bucket.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "s3:GetObject",
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.app_bucket.bucket}/*",
        "Principal": {
          "CanonicalUser": "${var.s3_canonical_user_id}"
        }
      }
    ]
  })
}