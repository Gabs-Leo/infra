resource "aws_instance" "ec2" {
  #ami           = data.aws_ami.ubuntu.id
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  user_data = var.user_data

  iam_instance_profile = aws_iam_instance_profile.ec2_codedeploy_instance_profile.name
  security_groups = [aws_security_group.ec2_security_group.name]
  key_name = var.key_name
  tags = var.tags
}