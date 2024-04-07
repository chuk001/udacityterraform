  #Locate the existing custom image
data "azurerm_image" "example" {
  name       = "myPackerImage"
  resource_group_name = "Azuredevops01"
}


variable "packer_image_id" {
  default  = "/subscriptions/3d34ebc4-17fd-4c71-a5cc-83007d91fb7d/resourceGroups/Azuredevops01/providers.Microsoft.compute/images/myPackerImage"
}