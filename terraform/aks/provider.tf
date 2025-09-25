terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.38.0"
    }
  }

    # backend "azurerm" {
    #   resource_group_name  = "tf-backend-rg"
    #   storage_account_name = "tfstate17568"
    #   container_name       = "tfstate"
    #   key                  = "infra.tfstate"
    # }

}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
