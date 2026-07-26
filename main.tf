terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "4b3a384b-b36e-407d-a447-5f12eb4e7442"
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "DevopsProject"
  location = "East US"
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "tolustorage2026"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Blob Container
resource "azurerm_storage_container" "container" {
  name                 = "mycontainer"
  storage_account_name = azurerm_storage_account.storage.name
}
