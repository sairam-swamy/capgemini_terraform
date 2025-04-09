output "peering_a_to_b_id" {
  value = azurerm_virtual_network_peering.peering_a_to_b.id
}

output "peering_b_to_a_id" {
  value = azurerm_virtual_network_peering.peering_b_to_a.id
}
