output "association_id" {
  value       = azurerm_network_interface_security_group_association.nic_nsg.id
  description = "ID of the NIC-NSG association"
}
