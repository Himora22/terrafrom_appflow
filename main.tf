terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
  cloud {

    organization = "SecureStorageTerraform"

    workspaces {
      name = "terrafromazure_api_workspace"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = "6b09cf51-5a98-4622-9757-14317d7313e9"
}
resource "azurerm_resource_group" "SeunT" {
  name     = "TerraWork"
  location = "Uk South"

}

module "securestrorage" {
  source               = "app.terraform.io/SecureStorageTerraform/securestrorage/azurerm"
  version              = "1.0.1"
  location             = azurerm_resource_group.SeunT.location
  resource_group_name  = azurerm_resource_group.SeunT.name
  storage_account_name = "StoreTerra"
  environment          = "dev"
}