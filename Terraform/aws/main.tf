locals {
    tags = {
        Project = var.project
        CreatedBy = var.created_by
        CreatedOn = timestamp()
        Environment = terraform.workspace
    }
}

module "ec2" {
    source = "./ec2"
    key_name = var.key_name
    tags = local.tags
}