module "source_storage_account" {
  source = "../../modules/storage_account"
  location = var.location
  resource_group_name = var.resource_group_name
  environment = var.environment
  name = "${var.project}0datasource"
  replication_type = var.replication_type
}

module "sink_storage_account" {
  source = "../../modules/storage_account"
  location = var.location
  resource_group_name = var.resource_group_name
  environment = var.environment
  name = "${var.project}0datasink"
  replication_type = var.replication_type
}

module "data_factory" {
  source = "../../modules/data_factory"
  name = var.project
  location = var.location
  resource_group_name = var.resource_group_name
  connection_string = module.source_storage_account.connection_string
}

