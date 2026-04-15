resource "azurerm_virtual_network" "k8s_vnet" {
  name                = "${var.prefix}-network"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "k8s_subnet" {
  name                 = var.subnet_names[0]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.k8s_vnet.name
  address_prefixes     = var.address_prefixes
  depends_on           = [azurerm_virtual_network.k8s_vnet]
}

resource "azurerm_network_security_group" "k8s_nsg" {
  name                = "${var.prefix}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_subnet.k8s_subnet]

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 22
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "k8s_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.k8s_subnet.id
  network_security_group_id = azurerm_network_security_group.k8s_nsg.id
  depends_on                = [azurerm_subnet.k8s_subnet, azurerm_network_security_group.k8s_nsg]
}
