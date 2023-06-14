resource "azurerm_resource_group" "az-rg" {
    name = var.az-rg-name
    location = var.az-rg-location
}