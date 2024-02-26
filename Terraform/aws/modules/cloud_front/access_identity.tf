resource "aws_cloudfront_origin_access_identity" "access_identity" {
  comment = "${var.project}-access-identity-${var.bucket_regional_domain_name}"
}