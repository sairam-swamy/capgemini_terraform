resource "azurerm_virtual_network_peering" "peering_a_to_b" {
  name                      = "peer-a-to-b"
  resource_group_name       = var.rg_name_a
  virtual_network_name      = var.vnet_name_a
  remote_virtual_network_id = var.vnet_id_b
  allow_forwarded_traffic   = true
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "peering_b_to_a" {
  name                      = "peer-b-to-a"
  resource_group_name       = var.rg_name_b
  virtual_network_name      = var.vnet_name_b
  remote_virtual_network_id = var.vnet_id_a
  allow_forwarded_traffic   = true
  allow_virtual_network_access = true
}
