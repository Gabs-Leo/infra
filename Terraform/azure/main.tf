module "data_factory" {
  source = "./structs/data_factory"
  storage_account_name = var.storage_account_name
  location = var.location
  resource_group_name = var.resource_group_name
  environment = terraform.workspace
  replication_type = var.replication_type
}