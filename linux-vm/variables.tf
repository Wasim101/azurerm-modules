variable "rg_location" {
    type = string
}

variable "rg_name"{
    type=string
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
    default = "128" 
}

variable "subnet_id" {
    type = string
    description = "subnet id"
}

variable "image_publisher" {
    type =string
    description = "Please mention the publisher of image you want to use"
    default = "Canonical"
}

variable "image_offer" {
    type =string
    description = "Please mention the offer of image you want to use"
    default = "0001-com-ubuntu-server-focal"
}

variable "image_sku" {
    type =string
    description = "Please mention the sku of the image"
    default = "20_04-lts"
}

variable "image_version" {
    type =string
    description = "Please mention the version of the image"
    default = "latest"
}

