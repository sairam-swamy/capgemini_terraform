resource "azurerm_subnet" "capgemini_subnet" {
  count               = 3
  name                = "${var.vnet_name}-subnet-${count.index + 1}"
  resource_group_name = var.resource_group_name
  virtual_network_name= var.vnet_name
  address_prefixes    = [cidrsubnet(var.vnet_cidr, 4, count.index)]
}
