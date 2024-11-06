provider "azurerm" {
  subscription_id = "068245d4-3c94-42fe-9c4d-9e5e1cabc60c"
  features {}
}

# Define a Resource Group
resource "azurerm_resource_group" "example_rg" {
  name     = "exampleResourceGroup"
  location = "East US"
}

# Define a Virtual Network (VNet)
resource "azurerm_virtual_network" "example_vnet" {
  name                = "exampleVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
}
