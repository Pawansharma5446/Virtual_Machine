terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "08ac2005-a8b7-48b7-a54d-544894ffa252"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "backend_rg"
    storage_account_name = "backendstorage01230123"
    container_name       = "backendcontainer"
    key                  = "three-tier.terraform.tfstate"
  }
}