resource "azurerm_lb" "example" {
  name = "${var.vm_name}-lb"
  resource_group_name = azurerm_resource_group.example.name 
  location = azurerm_resource_group.example.location  
  sku = "Standard"
  frontend_ip_configuration {
    name = "${var.vm_name}lb-publicip"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_lb_backend_address_pool" "example" {
  name = "web-backend"
  loadbalancer_id = azurerm_lb.example.id
}

resource "azurerm_lb_probe" "example" {
  name = "tcp-probe"
  protocol = "Tcp"
  port = 80
  loadbalancer_id = azurerm_lb.example.id
  }

  resource "azurerm_lb_rule" "example" {
  name = "lb_rule"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  frontend_ip_configuration_name = azurerm_lb.example.frontend_ip_configuration[0].name
    probe_id = azurerm_lb_probe.example.id 
  loadbalancer_id = azurerm_lb.example.id
  }

  resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
    network_interface_id = azurerm_network_interface.example.id 
  ip_configuration_name = azurerm_network_interface.example.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id   
}