resource "aws_cloudfront_distribution" "s3_distribution" {
  http_version = "http2"
  origin {
    domain_name = var.bucket_regional_domain_name
    origin_id = "${var.bucket_name}-origin"
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.access_identity.cloudfront_access_identity_path
    }
    /*
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }*/
  }
  enabled = true
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = "${var.bucket_name}-origin"
    compress = false
    smooth_streaming = false
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    #viewer_protocol_policy = "allow-all"
    #viewer_protocol_policy = "https-only"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    max_ttl                = 31536000
  }

  #is_ipv6_enabled     = true
  #comment             = "Some comment"
  default_root_object = "index.html"
  aliases = [var.record_name]

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    #cloudfront_default_certificate = true
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  price_class = "PriceClass_100"

  tags = {
    Environment = var.environment
  }
}