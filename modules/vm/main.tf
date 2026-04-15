resource "azurerm_public_ip" "k8s_public_ip" {
  name                = "${var.prefix}-${var.node_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
}

resource "azurerm_network_interface" "k8s_nic" {
  name                = "${var.prefix}-${var.node_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.prefix}-${var.node_name}-nic-config"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.k8s_public_ip.id
  }
}


resource "azurerm_virtual_machine" "k8s_vm" {
  name                  = "${var.prefix}-${var.node_name}-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.k8s_nic.id]
  vm_size               = var.vm_size

  delete_os_disk_on_termination    = var.delete_os_disk    # ✅ deletes OS disk on terraform destroy
  delete_data_disks_on_termination = var.delete_data_disks # ✅ deletes data disks on terraform destroy


  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image_version
  }

  storage_os_disk {
    name              = "${var.prefix}-${var.node_name}-os-disk"
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }

  os_profile {
    computer_name  = "${var.prefix}-${var.node_name}"
    admin_username = var.admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = var.path_ssh
      key_data = var.key_data
    }
  }
}
