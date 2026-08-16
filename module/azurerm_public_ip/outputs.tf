output "public_ip_id" {
  value       = azurerm_public_ip.pip.id
  description = "ID of the public IP"
}

output "public_ip_address" {
  value       = azurerm_public_ip.pip.ip_address
  description = "Allocated public IP address"
}
