
resource "aws_codepipeline" "codepipeline" {
  name     = "${var.project}-${var.environment}-codepipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_artifact_store.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn = aws_codestarconnections_connection.codestar.arn
        FullRepositoryId = "${var.full_repo_name}"
        BranchName = "${var.branch_name}"
      }
    }
    action {
      name             = "Infra"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["infra_output"]

      configuration = {
        ConnectionArn = aws_codestarconnections_connection.codestar.arn
        FullRepositoryId = "${var.infra_full_repo_name}"
        BranchName = "${var.infra_branch_name}"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name = "Build"
      category = "Build"
      owner = "AWS"
      provider = "CodeBuild"
      version = "1"
      
      input_artifacts = ["source_output", "infra_output"]

      configuration = {
        ProjectName = "${var.project}-${var.environment}-codebuild"
        PrimarySource = "infra_output"
      }

      output_artifacts = ["build_output"]
    }
  }

  stage {
    name = "Deploy"

    action {
      name = "Deploy"
      category = "Deploy"
      owner = "AWS"
      provider = "CodeDeploy"
      version = "1"

      input_artifacts = ["build_output"]


      configuration = {
        ApplicationName = var.app_name
        DeploymentGroupName = var.deployment_group
      }
    }
  }
}

resource "aws_codestarconnections_connection" "codestar" {
  name          = "${var.project}-${var.environment}-conn"
  provider_type = "GitHub"
}