variable "rg_name" {
    type = string
    description = "Name of the resource group"
}

variable "rg_location"{
    type = string
    description = "Name of the location where all the resource will be deployed"
}

variable "vm_name"{
    type = string
    description = "Name of the virtual machine"
}

variable "vm_size"{
    type = string
    description = "Size of virtual machine"
}

variable "admin_username"{
    type = string
    description = "admin username for the login to the virtual machine"
}

variable "caching_type"{
    type =string
    description = "Caching for the OS disk, e.g. ReadWrite, ReadOnly, None"
    default = "ReadWrite"
}

variable "acc_type"{
    type =string
    description = "Replication type for the OS disk"
    default = "Standard_LRS"
}

variable "os_disk_size" {
    type = string
    description = "Size for the OS disk"
    default = "128gb"
  
}



