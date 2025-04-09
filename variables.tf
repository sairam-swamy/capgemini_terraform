variable "resource_group_name" {
  default = "rg-provisioner-demo"
}

variable "location" {
  default = "Central India"
}

variable "vnet_name" {
  default = "vnet-demo"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "nsg_name" {
  default = "nsg-demo"
}

variable "vm_name" {
  default = "demo-vm"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  default = "YourP@ssword1234"
}
