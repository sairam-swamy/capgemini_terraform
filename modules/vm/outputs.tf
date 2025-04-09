output "vm_name" {
  value = azurerm_linux_virtual_machine.capgemini_vm.name
}

output "public_ip" {
  value = azurerm_public_ip.capgemini_public.ip_address
}

output "private_ip" {
  value = azurerm_network_interface.capgemini_interface.private_ip_address
}
