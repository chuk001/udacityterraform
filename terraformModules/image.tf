  #Locate the existing custom image
data "azurerm_image" "example" {
  name       = "myPackerImage"
  resource_group_name = "Azuredevops01"
}


variable "packer_image_id" {
  default  = "/subscriptions/enter subscription id/resourceGroups/enter resource group/providers.Microsoft.compute/images/myPackerImage"
}