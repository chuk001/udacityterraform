variable "prefix" {
    description = "This is the prefix for resource group"
}

variable "location" {
    description = "This is the default location"
    default = "East US"
}

# A scope determines what resources or grouping of resources the policy assignment gets enforced on. 
# It could range from a management group to an individual resource. 
# Be sure to replace {scope} with one of the following patterns based on the declared resource: