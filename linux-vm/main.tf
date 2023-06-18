module "rg1"{
    source = "../az-rg-module"
    az-rg-name = var.rg_name
    az-rg-location = var.rg_location
}

resource "azurerm_ntework_interface" "nic"{
    name = var.nic_name
    resource_group_name = module.rg1.az-rg-name
    location = module.rg1.az-rg-location

    ip_configuration {
        name = "internal"
        subnet_id = var.subnet_id
        private_ip_address_allocation = var.allocation_type
    }
}


resource "azurerm_linux_virtual_machine" "vm1"{
    name = var.vm_name
    location = module.rg1.az-rg-location
    resource_group_name = module.rg1.az-rg-name
    size = var.vm_size
    admin_username = var.admin_username
    network_interface_ids = [azurerm_network_interface.nic.id]

    admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = var.caching_type
    storage_account_type = var.acc_type
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "18_04-lts"
    version   = "latest"
  }
}
