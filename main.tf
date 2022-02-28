# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
  cloud {
    organization = "aguijap"
    workspaces {
      name = "aguijapwk1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westus2"
}
# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.2.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "Entorno prod"
    datos       = "Los necesarios"
    "team"      = "devops2"
  }
}
