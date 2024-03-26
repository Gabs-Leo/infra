resource "azurerm_storage_account" "sa" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.replication_type

  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_container" "sa_container" {
  name                  = var.name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}