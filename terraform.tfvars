resource_group_name     = "example-resources"
location                = "West Europe"
app_service_plan_name   = "example-serviceplan"
app_service_plan_tier   = "Standard"
app_service_plan_size   = "S1"
app_service_name        = "example-appservice"
os_type                 = "Windows"

app_settings = {
  "WEBSITE_RUN_FROM_PACKAGE" = "1"
}
