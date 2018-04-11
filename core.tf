resource "azurerm_resource_group" "carl" {
  location = "South Central US"
  name     = "core-dev-rg"
}

resource "azurerm_storage_account" "carl" {
  name                     = "carlmeyertonsdev"
  resource_group_name      = "${azurerm_resource_group.carl.name}"
  location                 = "${azurerm_resource_group.carl.location}"
  account_replication_type = "RAGRS"
  account_tier             = "Standard"
}
