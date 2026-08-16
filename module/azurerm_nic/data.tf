data "azurerm_subnet" "frountend_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

output "subnet_id" {
  value = data.azurerm_subnet.frountend_subnet.id
}
