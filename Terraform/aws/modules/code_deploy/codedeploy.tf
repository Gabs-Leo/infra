resource "aws_codedeploy_app" "codedeploy_app" {
  compute_platform = "Server"
  name             = "${var.project}-${var.environment}-cicd"
}

resource "aws_codedeploy_deployment_group" "codedeploy_deployment_group" {
  app_name              = aws_codedeploy_app.codedeploy_app.name
  deployment_group_name = "${var.project}-${var.environment}-deployment-group"
  service_role_arn      = aws_iam_role.codedeploy_role.arn
  #deployment_config_name = "CodeDeployDefault.AllAtOnce"

  ec2_tag_set {
    ec2_tag_filter {
      type  = "KEY_AND_VALUE"
      key   = "Project"
      value = var.project
    }

    ec2_tag_filter {
      type  = "KEY_AND_VALUE"
      key   = "Environment"
      value = var.environment
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  outdated_instances_strategy = "UPDATE"
/*
  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "IN_PLACE"
  }

  load_balancer_info {
    elb_info {
      name = aws_elb.example.name
    }
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout    = "STOP_DEPLOYMENT"
      wait_time_in_minutes = 60
    }

    green_fleet_provisioning_option {
      action = "DISCOVER_EXISTING"
    }

    terminate_blue_instances_on_deployment_success {
      action = "KEEP_ALIVE"
    }
  }
*/
}