variable "location" {
  default = "CentralIndia"
}
variable "resource_group_name" {
  default = "Capgemini_resource_group"
}
variable "vnet_name" {
  default = "capgemini-vnet"
}
variable "address_space" {
  default = ["192.168.0.0/16"]
}
variable "subnet_name" {
  default = "subnet-1"
}
variable "subnet_prefixes" {
  default = ["192.168.0.0/24"]
}
