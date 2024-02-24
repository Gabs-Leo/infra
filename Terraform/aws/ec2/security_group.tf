resource "aws_security_group" "ec2_security_group" {
  description = "${var.tags.Project}-${terraform.workspace}-security-group-ec2"
  name        = "${var.tags.Project}-${terraform.workspace}-security-group-ec2"
  #vpc_id      = var.network.vpc_id

  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Standard access to ec2"
      cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Standard access to ec2"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Standard access to ec2"
    cidr_blocks = ["0.0.0.0/0"] 
  
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}