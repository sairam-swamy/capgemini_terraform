provider "azurerm" {
  features {}
  subscription_id = "47f636c5-a7d0-455d-9a44-99c27e48c084"
}

resource "azurerm_resource_group" "capgemini" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.capgemini.name
  subnet_name         = var.subnet_name
  subnet_prefixes     = var.subnet_prefixes
}
