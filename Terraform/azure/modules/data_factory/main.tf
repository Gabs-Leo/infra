resource "azurerm_data_factory" "df" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "ls_blob" {
  name              = var.name
  data_factory_id   = azurerm_data_factory.df.id
  connection_string = var.connection_string
}