resource "azurerm_network_security_group" "nsg" {
  name                = "${var.application_type}-${var.resource_type}-nsg"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
   security_rule {
        name                       = "HTTP"
        priority                   = 1011
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }  
}
resource "azurerm_subnet_network_security_group_association" "azsub_nsga" {
    subnet_id                 = "${var.subnet_id}"
    network_security_group_id = azurerm_network_security_group.nsg.id
}
