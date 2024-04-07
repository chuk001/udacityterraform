resource "azurerm_network_interface" "example" {
  name                = "${var.vm_name}-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "example" {
  name                = "${var.vm_name}-publicip"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_availability_set" "example" {
  name                = "${var.vm_name}-aset"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "${var.vm_name}-vm"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.linux_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }



  depends_on = [ 
    azurerm_network_interface.example,
    tls_private_key.linux_key
     ]

}

resource "tls_private_key" "linux_key" {
    algorithm = "RSA"
    rsa_bits = 4096
  }

resource "local_file" "linuxkey" {
    filename = "linuxkey.pem"
    content = tls_private_key.linux_key.private_key_pem
  }