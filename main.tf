# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Create an App Service Plan
resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = var.os_type
  sku_name            = var.app_service_plan_size
}

# Create an App Service
resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_service_plan.example.id

  site_config {
    always_on = true
  }

  app_settings = var.app_settings
}

# Optional: Output the App Service URL
output "app_service_default_hostname" {
  value = azurerm_app_service.example.default_site_hostname
}
