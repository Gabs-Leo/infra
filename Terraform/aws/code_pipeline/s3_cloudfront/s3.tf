resource "aws_s3_bucket" "app_bucket" {
  bucket = var.record_name
}

resource "aws_s3_bucket_acl" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id
  acl    = "public-read"
  depends_on = [ 
    aws_s3_bucket_public_access_block.app_bucket,
    aws_s3_bucket_ownership_controls.app_bucket
  ]
}

resource "aws_s3_bucket_ownership_controls" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.app_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}