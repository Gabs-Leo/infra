locals {
    tags = {
        Project = var.project
        CreatedBy = var.created_by
        CreatedOn = timestamp()
        Environment = terraform.workspace
    }
    user_data = {
        docker = <<-EOF
            #!/bin/bash
            sudo apt-get update
            sudo apt install docker docker-compose -y
            sudo gpasswd -a $USER docker
            newgrp docker
        EOF
        code_deploy = <<-EOF
            #!/bin/bash
            sudo yum -y update
            sudo yum -y install ruby
            sudo yum -y install wget
            cd /home/ec2-user
            wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
            sudo chmod +x ./install
            sudo ./install auto
            sudo yum install -y python-pip
            sudo pip install awscli
        EOF
    }
}

module "ec2" {
    source = "./ec2"
    key_name = var.key_name
    project = var.project
    environment = terraform.workspace
    user_data = local.user_data.code_deploy
    tags = local.tags
}

module "codedeploy" {
    source = "./code_deploy"
    project = var.project
    environment = terraform.workspace
}

module "codepipeline" {
    source = "./codepipeline"
    project = var.project
    environment = terraform.workspace
    branch_name = var.branch_name
    full_repo_name = var.full_repo_name
    app_name = module.codedeploy.app_name
    deployment_group = module.codedeploy.deployment_group
    resources_arn = module.codedeploy.resources_arn
}