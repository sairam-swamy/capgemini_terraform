output "subnet_ids" {
  value = azurerm_subnet.capgemini_subnet[*].id
}
