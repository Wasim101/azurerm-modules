resource "azurerm_network_interface" "nic"{
    name = "${var.vm_name}-nic1"
    resource_group_name = var.rg_name
    location = var.rg_location

    ip_configuration {
        name = "internal"
        subnet_id = var.subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}


resource "azurerm_linux_virtual_machine" "vm1"{
    name = var.vm_name
    location = var.rg_location
    resource_group_name = var.rg_name
    size = var.vm_size
    admin_username = var.admin_username
    network_interface_ids = [azurerm_network_interface.nic.id]

    admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = var.caching_type
    storage_account_type = var.acc_type
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}
