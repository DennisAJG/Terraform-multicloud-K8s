terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-devops"
    storage_account_name = "devopstfstateh232lbed"
    container_name       = "tfstate"
    key                  = "azure/dev/networking/terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
