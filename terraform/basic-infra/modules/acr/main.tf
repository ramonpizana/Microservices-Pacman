resource "azurerm_container_registry" "acr" {
  name                = "registryPacman1"
  resource_group_name = "${var.resource_group}"
  location            = "centralus"
  sku                 = "Standard"
  admin_enabled       = false
}