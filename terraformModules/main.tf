provider "azurerm" {
  client_id       = "Enter client_id"
  client_secret   = "Enter secret"
  subscription_id = "Enter subscription id"
  tenant_id       =  "Enter tenant_id"
  features{}
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-RG"
  location = "${var.location}"
}