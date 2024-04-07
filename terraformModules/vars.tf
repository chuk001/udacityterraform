variable "prefix" {
    description = "This is the prefix for resource group"
}

variable "location" {
    description = "This is the default location"
    default = "East US"
}

variable "vm_name" {
    description = "This is virtual machine name, network resources & loadbalancer"
}

variable "address_prefix" {
    description = "Subnet prefix for the vnet"
    type = string
    default = "10.0.1.0/24"  
}

