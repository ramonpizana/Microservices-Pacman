terraform {
  required_version = ">=0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ramon-pizana"
    storage_account_name = "storagepacman29"
    container_name       = "containerpacman29"
    key                  = "terraform.tfstate"
    //access_key           = ""
  }

}