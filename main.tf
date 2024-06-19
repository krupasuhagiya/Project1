provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
}

resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    always_on = true
  }

  app_settings = var.app_settings
}


# Optional: Output the App Service URL
output "app_service_default_hostname" {
  value = azurerm_app_service.example.default_site_hostname
}
