resource "aws_codebuild_project" "codebuild" {
  name          = "${var.project}-${var.environment}-codebuild"
  description   = "CodeBuild project with GitHub source and Ubuntu image"
  service_role  = aws_iam_role.codebuild_role.arn

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:4.0"
    type         = "LINUX_CONTAINER"
    privileged_mode   = true

    environment_variable {
      name = "AWS_DEFAULT_REGION"
      value = "${var.region}"
    }

#    environment_variable  {
#      name = "AWS_ACCOUNT_ID"
#      value = "${var.account_ID}"
#    }

    environment_variable  {
      name = "IMAGE_REPO_NAME"
      value = "${var.environment}"
    }

  }
  
  #build_batch_config {
  #  service_role  = aws_iam_role.codebuild_role.arn
  #  combine_artifacts = true
  #}
  artifacts {
    name = "${var.project}-${var.environment}-codebuild-bucket"
    type = "CODEPIPELINE"
  }

  source {
    type     = "CODEPIPELINE"
    #buildspec = data.local_file.buildspec_local.content
    buildspec = "Terraform/aws/code_build/config/buildspec.yml"
    #location = "${var.github_location_main}"
  }
}