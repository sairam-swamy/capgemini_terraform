provider "azurerm" {
  features {}
  subscription_id = "47f636c5-a7d0-455d-9a44-99c27e48c084"
}

module "rg" {
  source   = "./modules/resource_group"
  name     = "Capgemini_Azure"
  location = "CentralIndia"
}

module "vnet_india" {
  source              = "./modules/vnet"
  name                = "vnet-india"
  address_space       = ["192.168.0.0/16"]
  location            = "CentralIndia"
  resource_group_name = module.rg.name
}

module "vnet_us" {
  source              = "./modules/vnet"
  name                = "vnet-us"
  address_space       = ["10.0.0.0/16"]
  location            = "CentralUS"
  resource_group_name = module.rg.name
}

module "subnet_india" {
  source              = "./modules/subnet"
  vnet_name           = module.vnet_india.name
  vnet_cidr           = "192.168.0.0/16"
  resource_group_name = module.rg.name
}

module "subnet_us" {
  source              = "./modules/subnet"
  vnet_name           = module.vnet_us.name
  vnet_cidr           = "10.0.0.0/16"
  resource_group_name = module.rg.name
}

module "nsg_india" {
  source              = "./modules/nsg"
  name                = "nsg-india"
  location            = "CentralIndia"
  resource_group_name = module.rg.name
}

module "nsg_us" {
  source              = "./modules/nsg"
  name                = "nsg-us"
  location            = "CentralUS"
  resource_group_name = module.rg.name
}

resource "azurerm_subnet_network_security_group_association" "india" {
  count                     = 3
  subnet_id                 = module.subnet_india.subnet_ids[count.index]
  network_security_group_id = module.nsg_india.id
}

resource "azurerm_subnet_network_security_group_association" "us" {
  count                     = 3
  subnet_id                 = module.subnet_us.subnet_ids[count.index]
  network_security_group_id = module.nsg_us.id
}

module "peering" {
  source      = "./modules/peering"
  rg_name_a   = module.rg.name
  vnet_name_a = module.vnet_india.name
  vnet_id_a   = module.vnet_india.id
  rg_name_b   = module.rg.name
  vnet_name_b = module.vnet_us.name
  vnet_id_b   = module.vnet_us.id
}

module "vm_india" {
  source              = "./modules/vm"
  name                = "vm-india"
  location            = "CentralIndia"
  resource_group_name = module.rg.name
  subnet_id           = module.subnet_india.subnet_ids[0]
  admin_username      = "azureuser"
  admin_password      = "YourP@ssword1234" # Use a secure password
}

module "vm_us" {
  source              = "./modules/vm"
  name                = "vm-us"
  location            = "CentralUS"
  resource_group_name = module.rg.name
  subnet_id           = module.subnet_us.subnet_ids[0]
  admin_username      = "azureuser"
  admin_password      = "YourP@ssword1234"
}

