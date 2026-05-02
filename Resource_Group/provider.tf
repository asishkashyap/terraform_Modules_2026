terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "BlueStar"
    storage_account_name = "tfstatefiledev"
    container_name       = "tfstatedev"
    key                  = "dev.terraform.tfstate"
  }

} 

provider "azurerm" {
  features {}
}
