variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "vm_size" {}

variable "admin_username" {
  description = "Administrative username"
  type        = string
}

variable "admin_password" {
  description = "Administrative password"
  type        = string
  sensitive   = true
}

variable "network_interface_id" {
  description = "NIC ID to attach to the VM"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "OS disk storage account type"
  type        = string
  default     = "Standard_LRS"
}

variable "publisher" {
  description = "Marketplace image publisher"
  type        = string
  default     = "Canonical"
}

variable "offer" {
  description = "Marketplace image offer"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "sku" {
  description = "Marketplace image SKU"
  type        = string
  default     = "22_04-lts-gen2"
}

# variable "version" {
#   description = "Marketplace image version"
#   type        = string
#   default     = "latest"
# }
