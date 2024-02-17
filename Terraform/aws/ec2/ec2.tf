resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt install docker docker-compose -y
    sudo gpasswd -a $USER docker
    newgrp docker
  EOF

  security_groups = [aws_security_group.ec2_security_group.name]
  key_name = var.key_name
  tags = var.tags
}