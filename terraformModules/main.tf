provider "azurerm" {
  client_id       = "fa0d7868-d750-4d0f-bfba-037705eb7d16"
  client_secret   = "PNR8Q~_CI3MjwMg_yi2nAG.vECBxdkXv6fgptaD0"
  subscription_id = "3d34ebc4-17fd-4c71-a5cc-83007d91fb7d"
  tenant_id       =  "f2372649-5058-4e09-99f0-7fa34a1d5361"
  features{}
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-RG"
  location = "${var.location}"
}