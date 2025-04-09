output "vnet_name" {
  value = azurerm_virtual_network.capgemini.name
}
output "subnet_id" {
  value = azurerm_subnet.capgemini_subnet.id
}
