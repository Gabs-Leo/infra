module "source_storage_account" {
  source = "../../modules/storage_account"
  location = var.location
  resource_group_name = var.resource_group_name
  environment = var.environment
  name = "${var.storage_account_name}0datasource"
  replication_type = var.replication_type
}

module "sink_storage_account" {
  source = "../../modules/storage_account"
  location = var.location
  resource_group_name = var.resource_group_name
  environment = var.environment
  name = "${var.storage_account_name}0datasink"
  replication_type = var.replication_type
}