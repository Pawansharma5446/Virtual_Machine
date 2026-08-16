module "resource_group" {
	source = "../../module/azurerm_resource_group"
	resource_group_name = var.resource_group_name
	location              = var.location
}

module "vnet" {
    depends_on = [ module.resource_group ]
    source = "../../module/azurerm_vnet"
    virtual_network_name = var.virtual_network_name
    location = var.location
    resource_group_name = var.resource_group_name
    address_space = var.address_space
}

module "subnet" {
 depends_on = [ module.resource_group, module.vnet ]
  source               = "../../module/azurerm_Subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefix       = var.address_prefix
  subnet_name          = var.subnet_name
  location             = var.location      
  address_space        = var.address_space 
}
 
module "public_ip" {
    depends_on = [ module.resource_group ]
    source               = "../../module/azurerm_public_ip"
    public_ip_name       = var.public_ip_name
    location             = var.location
    resource_group_name  = var.resource_group_name
    allocation_method    = var.public_ip_allocation_method
    sku                  = var.public_ip_sku
}

module "nsg" {
    depends_on = [ module.resource_group ]
    source              = "../../module/azurerm_nsg"
    nsg_name            = var.nsg_name
    location            = var.location
    resource_group_name = var.resource_group_name
}

module "nic" {
    depends_on = [ module.resource_group, module.vnet, module.subnet ]
    source = "../../module/azurerm_nic"
    nic_name = var.nic_name
    location = var.location
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
    subnet_name = var.subnet_name    
    public_ip_id = module.public_ip.public_ip_id
    network_security_group_id = module.nsg.nsg_id
}

module "nic_association" {
    depends_on = [ module.nic, module.nsg ]
    source = "../../module/azurerm_nic_association"
    network_interface_id = module.nic.nic_id
    network_security_group_id = module.nsg.nsg_id
}

module "vm" {
    depends_on = [ module.resource_group, module.nic ]
    source = "../../module/azurerm_virtual_machine"
    vm_name = var.vm_name
    location = var.location
    resource_group_name = var.resource_group_name
    vm_size = var.vm_size
    admin_username = var.admin_username
    admin_password = var.admin_password
    network_interface_id = module.nic.nic_id
}
