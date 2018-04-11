resource "azurerm_resource_group" "webapp" {
  location = "South Central US"
  name     = "vue-netcore2-dev-rg"
}

resource "azurerm_app_service_plan" "webapp" {
  name                = "dev-appserviceplan"
  location            = "${azurerm_resource_group.webapp.location}"
  resource_group_name = "${azurerm_resource_group.webapp.name}"
  kind                = "Linux"

  sku = {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "vue-netcore2-dev-app"
  location            = "${azurerm_resource_group.webapp.location}"
  resource_group_name = "${azurerm_resource_group.webapp.name}"
  app_service_plan_id = "${azurerm_app_service_plan.webapp.id}"
}
