variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "West Europe"
}

variable "app_service_plan_name" {
  description = "The name of the App Service plan"
  type        = string
}

variable "app_service_plan_tier" {
  description = "The pricing tier of the App Service plan"
  type        = string
  default     = "Standard"
}

variable "app_service_plan_size" {
  description = "The instance size of the App Service plan"
  type        = string
  default     = "S1"
}

variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}

variable "app_settings" {
  description = "A map of app settings"
  type        = map(string)
  default     = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}
