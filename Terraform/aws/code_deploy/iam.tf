resource "aws_iam_role" "codedeploy_role" {
  name = "${var.project}-${var.environment}-CodeDeploy-Role"

  assume_role_policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "codedeploy.amazonaws.com"
                ]
            },
            "Action": [
                "sts:AssumeRole"
            ]
        }
    ]}
  )
}

resource "aws_iam_role_policy" "codedeploy_policy" {
  name = "ec2_codedeploy_policy"
  role = aws_iam_role.codedeploy_role.name
  policy = jsonencode(
    {
      Version: "2012-10-17",
      Statement: [
          {
              Effect: "Allow",
              Action: [
                  "autoscaling:CompleteLifecycleAction",
                  "autoscaling:DeleteLifecycleHook",
                  "autoscaling:DescribeAutoScalingGroups",
                  "autoscaling:DescribeLifecycleHooks",
                  "autoscaling:PutLifecycleHook",
                  "autoscaling:RecordLifecycleActionHeartbeat",
                  "autoscaling:CreateAutoScalingGroup",
                  "autoscaling:CreateOrUpdateTags",
                  "autoscaling:UpdateAutoScalingGroup",
                  "autoscaling:EnableMetricsCollection",
                  "autoscaling:DescribePolicies",
                  "autoscaling:DescribeScheduledActions",
                  "autoscaling:DescribeNotificationConfigurations",
                  "autoscaling:SuspendProcesses",
                  "autoscaling:ResumeProcesses",
                  "autoscaling:AttachLoadBalancers",
                  "autoscaling:AttachLoadBalancerTargetGroups",
                  "autoscaling:PutScalingPolicy",
                  "autoscaling:PutScheduledUpdateGroupAction",
                  "autoscaling:PutNotificationConfiguration",
                  "autoscaling:PutWarmPool",
                  "autoscaling:DescribeScalingActivities",
                  "autoscaling:DeleteAutoScalingGroup",
                  "ec2:DescribeInstances",
                  "ec2:DescribeInstanceStatus",
                  "ec2:TerminateInstances",
                  "tag:GetResources",
                  "sns:Publish",
                  "cloudwatch:DescribeAlarms",
                  "cloudwatch:PutMetricAlarm",
                  "elasticloadbalancing:DescribeLoadBalancerAttributes",
                  "elasticloadbalancing:DescribeTargetGroupAttributes",
                  "elasticloadbalancing:DescribeLoadBalancers",
                  "elasticloadbalancing:DescribeInstanceHealth",
                  "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
                  "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
                  "elasticloadbalancing:DescribeTargetGroups",
                  "elasticloadbalancing:DescribeTargetHealth",
                  "elasticloadbalancing:RegisterTargets",
                  "elasticloadbalancing:DeregisterTargets"
              ],
              Resource: "*"
          }
    ]}
  )
}
