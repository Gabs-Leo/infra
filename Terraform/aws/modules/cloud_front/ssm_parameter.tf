resource "aws_ssm_parameter" "cloud_front_distro_id" {
  name  = "/CLOUDFRONT/${var.project}/CloudfrontDistributionId"
  type  = "String"
  value = aws_cloudfront_distribution.s3_distribution.id
}