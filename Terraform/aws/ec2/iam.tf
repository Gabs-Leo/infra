resource "aws_iam_instance_profile" "ec2_codedeploy_instance_profile" {
  name = "${var.project}-${var.environment}-Ec2-CodeDeploy-Instance-Profile"
  role = aws_iam_role.ec2_codedeploy_role.name
}

resource "aws_iam_role" "ec2_codedeploy_role" {
  name = "${var.project}-${var.environment}-Ec2-CodeDeploy-Role"

  assume_role_policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]}
  )
}

resource "aws_iam_role_policy" "ec2_codedeploy_policy" {
  name = "ec2_codedeploy_policy"
  role = aws_iam_role.ec2_codedeploy_role.name
  policy = jsonencode({
        Version: "2012-10-17",
        Statement: [
            {
                Action: [
                    "s3:GetObject",
                    "s3:GetObjectVersion",
                    "s3:ListBucket"
                ],
                Effect: "Allow",
                Resource: "*"
            }
        ]
    })
}